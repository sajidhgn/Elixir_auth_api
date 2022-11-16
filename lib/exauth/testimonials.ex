defmodule Exauth.Testimonials do
  @moduledoc """
  The Testimonials context.
  """

  import Ecto.Query, warn: false
  alias Exauth.Repo

  alias Exauth.Testimonials.Testimonial

  @doc """
  Returns the list of testimonials.

  ## Examples

      iex> list_testimonials()
      [%Testimonial{}, ...]

  """
  def list_testimonials do
    Repo.all(Testimonial)
  end

  @doc """
  Gets a single testimonial.

  Raises `Ecto.NoResultsError` if the Testimonial does not exist.

  ## Examples

      iex> get_testimonial!(123)
      %Testimonial{}

      iex> get_testimonial!(456)
      ** (Ecto.NoResultsError)

  """
  def get_testimonial!(id), do: Repo.get!(Testimonial, id)

  @doc """
  Creates a testimonial.

  ## Examples

      iex> create_testimonial(%{field: value})
      {:ok, %Testimonial{}}

      iex> create_testimonial(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_testimonial(attrs \\ %{}) do
    %Testimonial{}
    |> Testimonial.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a testimonial.

  ## Examples

      iex> update_testimonial(testimonial, %{field: new_value})
      {:ok, %Testimonial{}}

      iex> update_testimonial(testimonial, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_testimonial(%Testimonial{} = testimonial, attrs) do
    testimonial
    |> Testimonial.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a testimonial.

  ## Examples

      iex> delete_testimonial(testimonial)
      {:ok, %Testimonial{}}

      iex> delete_testimonial(testimonial)
      {:error, %Ecto.Changeset{}}

  """
  def delete_testimonial(%Testimonial{} = testimonial) do
    Repo.delete(testimonial)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking testimonial changes.

  ## Examples

      iex> change_testimonial(testimonial)
      %Ecto.Changeset{data: %Testimonial{}}

  """
  def change_testimonial(%Testimonial{} = testimonial, attrs \\ %{}) do
    Testimonial.changeset(testimonial, attrs)
  end
end
