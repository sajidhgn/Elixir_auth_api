defmodule ExauthWeb.Services_InfoController do
  use ExauthWeb, :controller

  alias Exauth.Services_Infos
  alias Exauth.Services_Infos.Services_Info
  use PhoenixSwagger

  action_fallback ExauthWeb.FallbackController

  def index(conn, _params) do
    services_infos = Services_Infos.list_services_infos()
    render(conn, "index.json", services_infos: services_infos)
  end

  def create(conn, services__info_params) do
    with {:ok, %Services_Info{} = services__info} <- Services_Infos.create_services__info(services__info_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ExauthWeb.Router.Helpers.services__info_path(conn, :show, services__info))
      |> render("show.json", services__info: services__info)
    end
  end

  swagger_path :create do
    post("/api/services_infos")
    summary("Services info creation")
    description("Services info creation")
    produces("application/json")
    security([%{Bearer: []}])
    parameters do
      body(:body, Schema.ref(:CreateServicesInfo), "Services info Params", required: true)
    end

    response(200, "Ok")
  end

  def show(conn, %{"id" => id}) do
    services__info = Services_Infos.get_services__info!(id)
    render(conn, "show.json", services__info: services__info)
  end

  def update(conn, %{"id" => id, "services__info" => services__info_params}) do
    services__info = Services_Infos.get_services__info!(id)

    with {:ok, %Services_Info{} = services__info} <- Services_Infos.update_services__info(services__info, services__info_params) do
      render(conn, "show.json", services__info: services__info)
    end
  end

  def delete(conn, %{"id" => id}) do
    services__info = Services_Infos.get_services__info!(id)

    with {:ok, %Services_Info{}} <- Services_Infos.delete_services__info(services__info) do
      send_resp(conn, :no_content, "")
    end
  end



  def swagger_definitions do
    %{

      CreateServicesInfo:
        swagger_schema do
          title("Services info Schema")
          description("Services info Schema")

          properties do
            info(:string, "info", required: true)

          end

          example(%{
            info: "Title"
          })
        end
    }
  end


  end
