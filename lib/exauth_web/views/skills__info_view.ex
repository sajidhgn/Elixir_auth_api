defmodule ExauthWeb.Skills_InfoView do
  use ExauthWeb, :view
  alias ExauthWeb.Skills_InfoView

  def render("index.json", %{skills_infos: skills_infos}) do
    %{data: render_many(skills_infos, Skills_InfoView, "skills__info.json")}
  end

  def render("show.json", %{skills__info: skills__info}) do
    %{data: render_one(skills__info, Skills_InfoView, "skills__info.json")}
  end

  def render("skills__info.json", %{skills__info: skills__info}) do
    %{
      id: skills__info.id,
      title: skills__info.title,
      detail: skills__info.detail
    }
  end
end
