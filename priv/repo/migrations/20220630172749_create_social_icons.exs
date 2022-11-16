defmodule Exauth.Repo.Migrations.CreateSocialIcons do
  use Ecto.Migration

  def change do
    create table(:social_icons) do
      add :name, :string
      add :link, :string

      timestamps()
    end
  end
end
