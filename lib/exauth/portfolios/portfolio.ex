defmodule Exauth.Portfolios.Portfolio do
  use Ecto.Schema
  import Ecto.Changeset

  schema "portfolios" do
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(portfolio, attrs) do
    portfolio
    |> cast(attrs, [:title, :image])
    |> validate_required([:title, :image])
  end
end
