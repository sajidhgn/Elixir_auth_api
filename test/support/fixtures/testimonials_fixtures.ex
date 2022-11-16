defmodule Exauth.TestimonialsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Testimonials` context.
  """

  @doc """
  Generate a testimonial.
  """
  def testimonial_fixture(attrs \\ %{}) do
    {:ok, testimonial} =
      attrs
      |> Enum.into(%{
        designation: "some designation",
        detail: "some detail",
        image: "some image",
        name: "some name"
      })
      |> Exauth.Testimonials.create_testimonial()

    testimonial
  end
end
