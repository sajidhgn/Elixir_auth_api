defmodule Exauth.Repo.Migrations.CreateTestimonials do
  use Ecto.Migration

  def change do
    create table(:testimonials) do
      add :image, :string
      add :name, :string
      add :designation, :string
      add :detail, :string

      timestamps()
    end
  end
end
