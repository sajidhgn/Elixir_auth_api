defmodule ExauthWeb.Social_iconController do
  use ExauthWeb, :controller

  alias Exauth.Social_Icons
  alias Exauth.Social_Icons.Social_icon

  action_fallback ExauthWeb.FallbackController

  def index(conn, _params) do
    social_icons = Social_Icons.list_social_icons()
    render(conn, "index.json", social_icons: social_icons)
  end

  def create(conn, %{"social_icon" => social_icon_params}) do
    with {:ok, %Social_icon{} = social_icon} <- Social_Icons.create_social_icon(social_icon_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ExauthWeb.Router.Helpers.social_icon_path(conn, :show, social_icon))
      |> render("show.json", social_icon: social_icon)
    end
  end

  def show(conn, %{"id" => id}) do
    social_icon = Social_Icons.get_social_icon!(id)
    render(conn, "show.json", social_icon: social_icon)
  end

  def update(conn, %{"id" => id, "social_icon" => social_icon_params}) do
    social_icon = Social_Icons.get_social_icon!(id)

    with {:ok, %Social_icon{} = social_icon} <- Social_Icons.update_social_icon(social_icon, social_icon_params) do
      render(conn, "show.json", social_icon: social_icon)
    end
  end

  def delete(conn, %{"id" => id}) do
    social_icon = Social_Icons.get_social_icon!(id)

    with {:ok, %Social_icon{}} <- Social_Icons.delete_social_icon(social_icon) do
      send_resp(conn, :no_content, "")
    end
  end
end
