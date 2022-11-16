defmodule Exauth.Services_Infos.Services_Info do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services_infos" do
    field :info, :string

    timestamps()
  end

  @doc false
  def changeset(services__info, attrs) do
    services__info
    |> cast(attrs, [:info])
    |> validate_required([:info])
  end
end
