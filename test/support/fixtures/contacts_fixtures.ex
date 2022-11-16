defmodule Exauth.ContactsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Contacts` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        detail: "some detail",
        title: "some title"
      })
      |> Exauth.Contacts.create_contact()

    contact
  end
end
