defmodule Exauth.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :detail, :string
    field :icon, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:icon, :title, :detail])
    |> validate_required([:icon, :title, :detail])
  end
end
