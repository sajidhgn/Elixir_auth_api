defmodule Exauth.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :icon, :string
      add :title, :string
      add :detail, :string

      timestamps()
    end
  end
end
