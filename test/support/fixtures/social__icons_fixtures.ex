defmodule Exauth.Social_IconsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Social_Icons` context.
  """

  @doc """
  Generate a social_icon.
  """
  def social_icon_fixture(attrs \\ %{}) do
    {:ok, social_icon} =
      attrs
      |> Enum.into(%{
        link: "some link",
        name: "some name"
      })
      |> Exauth.Social_Icons.create_social_icon()

    social_icon
  end
end
