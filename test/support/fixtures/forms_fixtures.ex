defmodule Exauth.FormsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Forms` context.
  """

  @doc """
  Generate a form.
  """
  def form_fixture(attrs \\ %{}) do
    {:ok, form} =
      attrs
      |> Enum.into(%{
        placeholder: "some placeholder",
        required: "some required",
        title: "some title",
        type: "some type"
      })
      |> Exauth.Forms.create_form()

    form
  end
end
