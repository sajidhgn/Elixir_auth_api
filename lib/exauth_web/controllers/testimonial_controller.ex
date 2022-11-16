defmodule ExauthWeb.TestimonialController do
  use ExauthWeb, :controller

  alias Exauth.Testimonials
  alias Exauth.Testimonials.Testimonial

  action_fallback ExauthWeb.FallbackController

  def index(conn, _params) do
    testimonials = Testimonials.list_testimonials()
    render(conn, "index.json", testimonials: testimonials)
  end

  def create(conn, %{"testimonial" => testimonial_params}) do
    with {:ok, %Testimonial{} = testimonial} <- Testimonials.create_testimonial(testimonial_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ExauthWeb.Router.Helpers.testimonial_path(conn, :show, testimonial))
      |> render("show.json", testimonial: testimonial)
    end
  end

  def show(conn, %{"id" => id}) do
    testimonial = Testimonials.get_testimonial!(id)
    render(conn, "show.json", testimonial: testimonial)
  end

  def update(conn, %{"id" => id, "testimonial" => testimonial_params}) do
    testimonial = Testimonials.get_testimonial!(id)

    with {:ok, %Testimonial{} = testimonial} <- Testimonials.update_testimonial(testimonial, testimonial_params) do
      render(conn, "show.json", testimonial: testimonial)
    end
  end

  def delete(conn, %{"id" => id}) do
    testimonial = Testimonials.get_testimonial!(id)

    with {:ok, %Testimonial{}} <- Testimonials.delete_testimonial(testimonial) do
      send_resp(conn, :no_content, "")
    end
  end
end
