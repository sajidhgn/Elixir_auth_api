defmodule Exauth.Repo.Migrations.CreateAbouts do
  use Ecto.Migration

  def change do
    create table(:abouts) do
      add :name, :string
      add :designation, :string
      add :about_detail, :string
      add :hire_link, :string
      add :portfolio_link, :string
      add :profile, :string

      timestamps()
    end
  end
end
