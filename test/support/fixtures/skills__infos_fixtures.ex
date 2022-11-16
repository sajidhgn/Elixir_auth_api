defmodule Exauth.Skills_InfosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Skills_Infos` context.
  """

  @doc """
  Generate a skills__info.
  """
  def skills__info_fixture(attrs \\ %{}) do
    {:ok, skills__info} =
      attrs
      |> Enum.into(%{
        detail: "some detail",
        title: "some title"
      })
      |> Exauth.Skills_Infos.create_skills__info()

    skills__info
  end
end
