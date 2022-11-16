defmodule Exauth.Repo.Migrations.CreateForms do
  use Ecto.Migration

  def change do
    create table(:forms) do
      add :title, :string
      add :type, :string
      add :placeholder, :string
      add :required, :string

      timestamps()
    end
  end
end
