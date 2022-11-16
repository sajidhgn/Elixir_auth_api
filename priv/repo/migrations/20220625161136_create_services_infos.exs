defmodule Exauth.Repo.Migrations.CreateServicesInfos do
  use Ecto.Migration

  def change do
    create table(:services_infos) do
      add :info, :string

      timestamps()
    end
  end
end
