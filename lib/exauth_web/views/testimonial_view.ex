defmodule ExauthWeb.TestimonialView do
  use ExauthWeb, :view
  alias ExauthWeb.TestimonialView

  def render("index.json", %{testimonials: testimonials}) do
    %{data: render_many(testimonials, TestimonialView, "testimonial.json")}
  end

  def render("show.json", %{testimonial: testimonial}) do
    %{data: render_one(testimonial, TestimonialView, "testimonial.json")}
  end

  def render("testimonial.json", %{testimonial: testimonial}) do
    %{
      id: testimonial.id,
      image: testimonial.image,
      name: testimonial.name,
      designation: testimonial.designation,
      detail: testimonial.detail
    }
  end
end
