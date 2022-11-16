defmodule Exauth.Social_Icons.Social_icon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "social_icons" do
    field :link, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(social_icon, attrs) do
    social_icon
    |> cast(attrs, [:name, :link])
    |> validate_required([:name, :link])
  end
end
