defmodule Exauth.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :percentage, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:title, :percentage])
    |> validate_required([:title, :percentage])
  end
end
