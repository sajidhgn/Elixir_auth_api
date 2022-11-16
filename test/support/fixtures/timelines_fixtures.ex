defmodule Exauth.TimelinesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Timelines` context.
  """

  @doc """
  Generate a timeline.
  """
  def timeline_fixture(attrs \\ %{}) do
    {:ok, timeline} =
      attrs
      |> Enum.into(%{
        detail: "some detail",
        title: "some title",
        year: "some year"
      })
      |> Exauth.Timelines.create_timeline()

    timeline
  end
end
