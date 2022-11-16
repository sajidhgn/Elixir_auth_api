defmodule ExauthWeb.AuthController do
  use ExauthWeb, :controller

  use PhoenixSwagger
  alias Exauth.Accounts
  alias ExauthWeb.Utils
  alias Exauth.Accounts.User
  alias ExauthWeb.JWTToken

  # def ping(conn, _params) do
  #   conn
  #   |> render("ack.json", %{success: true, message: pong})
  # end

  @spec register(
          Plug.Conn.t(),
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Plug.Conn.t()
  def register(conn, params) do
    IO.inspect(params)

    case Accounts.create_user(params) do
      {:ok, _user} ->
        conn |> render("ack.json", %{success: true, message: "Registeration successful"})

      {:errror, %Ecto.Changeset{} = changeset} ->
        conn |> render("errors.json", %{errors: Utils.format_changeset_errors(changeset)})

      _ ->
        conn |> render("error.json", %{error: Utils.internal_server_error()})
    end
  end

  #  Swagger Registeration
  swagger_path :register do
    post("/api/register")
    summary("Register")
    description("Signup User")
    produces("application/json")

    parameters do
      body(:body, Schema.ref(:SignUp), "Signup Params", required: true)
    end

    response(200, "Ok")
  end

  # Login Function

  @spec login(Plug.Conn.t(), map) :: Plug.Conn.t()
  def login(conn, %{"username" => username, "password" => password}) do
    with %User{} = user <- Accounts.get_user_by_username(username),
         true <- Pbkdf2.verify_pass(password, user.password) do
      signer =
        Joken.Signer.create(
          "HS256",
          "Gs09dFPo9jggjPLc57dvz3O/v5RifmRuHz1jPlPOIVQQXhqLggy083Nm8egqSPwQ"
        )

      extra_claims = %{user_id: user.id}
      {:ok, token, _claims} = JWTToken.generate_and_sign(extra_claims, signer)
      {:ok, _claims} = JWTToken.verify_and_validate(token, signer)
      conn |> render("login.json", %{success: true, message: "Login Successful", token: token})
    else
      _ -> conn |> render("error.json", %{error: "something issue occured"})
    end
  end

  swagger_path :login do
    post("/api/login")
    summary("Login")
    description("Login with email and password")
    produces("application/json")

    parameters do
      body(:body, Schema.ref(:SignIn), "Login Params", required: true)
    end

    response(200, "Ok")
  end

  @spec get(Plug.Conn.t(), any) :: Plug.Conn.t()
  def get(conn, _params) do
    conn |> render("data.json", %{data: conn.assigns.current_user})
  end

  @spec list(Plug.Conn.t(), any) :: Plug.Conn.t()
  def list(conn, _params) do
    list = Accounts.list_users()
    conn |> render("list.json", %{list: list})
  end

  def swagger_definitions do
    %{
      SignIn:
        swagger_schema do
          title("Sign in User Schema")
          description("User Sign In Schema")

          properties do
            username(:string, "username", required: true)
            password(:string, "password", required: true)
          end

          example(%{
            username: "sajidhgns",
            password: "1122334455"
          })
        end,
      SignUp:
        swagger_schema do
          title("Sign Up User Schema")
          description("User Sign Up Schema")

          properties do
            username(:string, "username", required: true)
            email(:string, "email", required: true)
            password(:string, "password", required: true)
          end

          example(%{
            username: "sajidhgns",
            email: "sajidhgns23@gmail.com",
            password: "1122334455"
          })
        end
    }
  end
end
