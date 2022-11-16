defmodule Exauth.ServicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Services` context.
  """

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        detail: "some detail",
        icon: "some icon",
        title: "some title"
      })
      |> Exauth.Services.create_service()

    service
  end
end
