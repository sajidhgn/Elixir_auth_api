defmodule Exauth.AboutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Abouts` context.
  """

  @doc """
  Generate a about.
  """
  def about_fixture(attrs \\ %{}) do
    {:ok, about} =
      attrs
      |> Enum.into(%{
        about_detail: "some about_detail",
        designation: "some designation",
        hire_link: "some hire_link",
        name: "some name",
        portfolio_link: "some portfolio_link",
        profile: "some profile"
      })
      |> Exauth.Abouts.create_about()

    about
  end
end
