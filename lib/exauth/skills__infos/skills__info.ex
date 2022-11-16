defmodule Exauth.Skills_Infos.Skills_Info do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills_infos" do
    field :detail, :string
    field :title, :string
    field :icon, :string

    timestamps()
  end

  @doc false
  def changeset(skills__info, attrs) do
    skills__info
    |> cast(attrs, [:title, :detail, :icon])
    |> validate_required([:title, :detail, :icon])
  end
end
