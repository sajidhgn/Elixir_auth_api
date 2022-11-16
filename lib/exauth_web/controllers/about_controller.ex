defmodule ExauthWeb.AboutController do
  use ExauthWeb, :controller

  use PhoenixSwagger
  alias Exauth.Abouts
  alias Exauth.Abouts.About
  alias ExauthWeb.Utils

  # def ping(conn, _params) do
  #   conn
  #   |> render("ack.json", %{success: true, message: pong})
  # end

  @spec create(
          Plug.Conn.t(),
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Plug.Conn.t()
  def create(conn, params) do
    IO.inspect("asdf")

  case Abouts.create_about(params) do
    {:ok, _about} -> conn |> render("about.json", %{success: true, message: "About data added successful"})
    {:errror, %Ecto.Changeset{} = changeset} -> conn |> render("errors.json", %{errors: Utils.format_changeset_errors(changeset)})
    _ -> conn |> render("error.json", %{error: Utils.internal_server_error()})
  end
  end

  swagger_path :create do
    post("/api/about/create")
    summary("About info creation")
    description("About info creation")
    produces("application/json")
    security([%{Bearer: []}])

    parameters do
      body(:body, Schema.ref(:CreateAbout), "About info Params", required: true)
    end
    response(200, "Ok")
  end


  @spec list(Plug.Conn.t(), any) :: Plug.Conn.t()
  def list(conn,_params) do
    list = Abouts.list_abouts();
  conn |> render("list.json", %{list: list})
  end

  swagger_path :list do
    get("/api/about/list")
    summary("Get total about content")
    description("Get total about content")
    produces("application/json")
    security([%{Bearer: []}])
    response(200, "Ok", Schema.ref(:TotalAbouts))
  end

    @spec get_by_id(Plug.Conn.t(), map) :: Plug.Conn.t()
    def get_by_id(conn,%{"id"=>id}) do
    data = Abouts.get_about!(id);
  conn |> render("edit.json", %{data: data})
  end


  def update(conn, %{"id" => id, "data" => params}) do

    getById = Abouts.get_about!(id)

    with {:ok, %About{} = data} <- Abouts.update_about(getById, params) do
      render(conn, "update.json", data: data)
    end
end


@spec swagger_definitions :: %{CreateAbout: any, TotalAbouts: any}
def swagger_definitions do
  %{
    TotalAbouts:
      swagger_schema do
        title("Abouts Us")
        description("About me details")

        example(%{})
      end,
      CreateAbout:
      swagger_schema do
        title("About me Schema")
        description("About me Schema")

        properties do
          name(:string, "name", required: true)
          designation(:string, "designation", required: true)
          about_detail(:string, "about_detail", required: true)
          hire_link(:string, "hire_link", required: true)
          portfolio_link(:string, "portfolio_link", required: true)
          profile(:string, "profile", required: true)
        end

        example(%{
          name: "sajid",
          designation: "developer",
          about_detail: "full stack developer",
          hire_link: "http://sajidhgn.com",
          portfolio_link: "http://sajidhgn.com",
          profile: "profile link"
        })
      end
  }
end


end
