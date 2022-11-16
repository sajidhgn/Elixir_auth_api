defmodule ExauthWeb.PageController do
  use ExauthWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
