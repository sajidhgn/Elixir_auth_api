defmodule Exauth.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add :title, :string
      add :image, :string

      timestamps()
    end
  end
end
