defmodule Exauth.Timelines.Timeline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timelines" do
    field :detail, :string
    field :title, :string
    field :year, :string

    timestamps()
  end

  @doc false
  def changeset(timeline, attrs) do
    timeline
    |> cast(attrs, [:title, :detail, :year])
    |> validate_required([:title, :detail, :year])
  end
end
