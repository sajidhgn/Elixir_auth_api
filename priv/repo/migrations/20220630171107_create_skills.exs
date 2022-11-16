defmodule Exauth.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :title, :string
      add :percentage, :string

      timestamps()
    end
  end
end
