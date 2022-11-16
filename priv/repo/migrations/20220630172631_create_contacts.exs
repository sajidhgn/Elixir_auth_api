defmodule Exauth.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :title, :string
      add :detail, :string

      timestamps()
    end
  end
end
