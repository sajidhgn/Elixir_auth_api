defmodule Exauth.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset

  schema "forms" do
    field :placeholder, :string
    field :required, :string
    field :title, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:title, :type, :placeholder, :required])
    |> validate_required([:title, :type, :placeholder, :required])
  end
end
