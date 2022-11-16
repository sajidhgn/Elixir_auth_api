defmodule Exauth.Repo.Migrations.CreateTimelines do
  use Ecto.Migration

  def change do
    create table(:timelines) do
      add :title, :string
      add :detail, :string
      add :year, :string

      timestamps()
    end
  end
end
