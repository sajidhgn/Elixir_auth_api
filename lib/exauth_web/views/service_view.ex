defmodule ExauthWeb.ServiceView do
  use ExauthWeb, :view
  alias ExauthWeb.ServiceView

  def render("index.json", %{services: services}) do
    %{data: render_many(services, ServiceView, "service.json")}
  end

  def render("show.json", %{service: service}) do
    %{data: render_one(service, ServiceView, "service.json")}
  end

  def render("service.json", %{service: service}) do
    %{
      id: service.id,
      icon: service.icon,
      title: service.title,
      detail: service.detail
    }
  end
end
