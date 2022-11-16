defmodule Exauth.Services_InfosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Services_Infos` context.
  """

  @doc """
  Generate a services__info.
  """
  def services__info_fixture(attrs \\ %{}) do
    {:ok, services__info} =
      attrs
      |> Enum.into(%{
        info: "some info"
      })
      |> Exauth.Services_Infos.create_services__info()

    services__info
  end
end
