defmodule Exauth.SkillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Skills` context.
  """

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        percentage: "some percentage",
        title: "some title"
      })
      |> Exauth.Skills.create_skill()

    skill
  end
end
