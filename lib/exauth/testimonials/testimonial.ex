defmodule Exauth.Testimonials.Testimonial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "testimonials" do
    field :designation, :string
    field :detail, :string
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(testimonial, attrs) do
    testimonial
    |> cast(attrs, [:image, :name, :designation, :detail])
    |> validate_required([:image, :name, :designation, :detail])
  end
end
