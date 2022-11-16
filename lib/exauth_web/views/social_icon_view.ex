defmodule ExauthWeb.Social_iconView do
  use ExauthWeb, :view
  alias ExauthWeb.Social_iconView

  def render("index.json", %{social_icons: social_icons}) do
    %{data: render_many(social_icons, Social_iconView, "social_icon.json")}
  end

  def render("show.json", %{social_icon: social_icon}) do
    %{data: render_one(social_icon, Social_iconView, "social_icon.json")}
  end

  def render("social_icon.json", %{social_icon: social_icon}) do
    %{
      id: social_icon.id,
      name: social_icon.name,
      link: social_icon.link
    }
  end
end
