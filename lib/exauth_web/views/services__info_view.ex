defmodule ExauthWeb.Services_InfoView do
  use ExauthWeb, :view
  alias ExauthWeb.Services_InfoView

  def render("index.json", %{services_infos: services_infos}) do
    %{data: render_many(services_infos, Services_InfoView, "services__info.json")}
  end

  def render("show.json", %{services__info: services__info}) do
    %{data: render_one(services__info, Services_InfoView, "services__info.json")}
  end

  def render("services__info.json", %{services__info: services__info}) do
    %{
      id: services__info.id,
      info: services__info.info
    }
  end
end
