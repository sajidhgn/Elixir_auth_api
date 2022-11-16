defmodule Exauth.Repo.Migrations.CreateSkillsInfos do
  use Ecto.Migration

  def change do
    create table(:skills_infos) do
      add :title, :string
      add :detail, :string
      add :icon, :string

      timestamps()
    end
  end
end
