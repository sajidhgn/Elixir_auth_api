defmodule Exauth.Abouts.About do
  use Ecto.Schema
  import Ecto.Changeset
  use  Waffle.Ecto.Schema

  @derive {Jason.Encoder, except: [:__meta__]}
  schema "abouts" do
    field :about_detail, :string
    field :designation, :string
    field :hire_link, :string
    field :name, :string
    field :portfolio_link, :string
    field :profile, Exauth.FileImage.Type
    # field :profile, :string

    timestamps()
  end

  @doc false
  def changeset(about, attrs) do
    about
    |> cast(attrs, [:name, :designation, :about_detail, :hire_link, :portfolio_link, :profile])
    |> cast_attachments(attrs, [:profile], allow_paths: true)
    |> validate_required([:name, :designation, :about_detail, :hire_link, :portfolio_link])
  end
end
