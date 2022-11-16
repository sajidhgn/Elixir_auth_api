defmodule ExauthWeb.Skills_InfoController do
  use ExauthWeb, :controller

  alias Exauth.Skills_Infos
  alias Exauth.Skills_Infos.Skills_Info

  action_fallback ExauthWeb.FallbackController

  def index(conn, _params) do
    skills_infos = Skills_Infos.list_skills_infos()
    render(conn, "index.json", skills_infos: skills_infos)
  end

  def create(conn, %{"skills__info" => skills__info_params}) do
    with {:ok, %Skills_Info{} = skills__info} <- Skills_Infos.create_skills__info(skills__info_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.skills__info_path(conn, :show, skills__info))
      |> render("show.json", skills__info: skills__info)
    end
  end

  def show(conn, %{"id" => id}) do
    skills__info = Skills_Infos.get_skills__info!(id)
    render(conn, "show.json", skills__info: skills__info)
  end

  def update(conn, %{"id" => id, "skills__info" => skills__info_params}) do
    skills__info = Skills_Infos.get_skills__info!(id)

    with {:ok, %Skills_Info{} = skills__info} <- Skills_Infos.update_skills__info(skills__info, skills__info_params) do
      render(conn, "show.json", skills__info: skills__info)
    end
  end

  def delete(conn, %{"id" => id}) do
    skills__info = Skills_Infos.get_skills__info!(id)

    with {:ok, %Skills_Info{}} <- Skills_Infos.delete_skills__info(skills__info) do
      send_resp(conn, :no_content, "")
    end
  end
end
