defmodule Exauth.Abouts do
  @moduledoc """
  The Abouts context.
  """

  import Ecto.Query, warn: false
  alias Exauth.Repo

  alias Exauth.Abouts.About

  @doc """
  Returns the list of abouts.

  ## Examples

      iex> list_abouts()
      [%About{}, ...]

  """
  def list_abouts do
    Repo.all(About)
  end

  # def get_single_data do
  #   from(u in About, order_by: [asc: u.id], limit: 1) |> Repo.one()
  # end

  @doc """
  Gets a single about.

  Raises `Ecto.NoResultsError` if the About does not exist.

  ## Examples

      iex> get_about!(123)
      %About{}

      iex> get_about!(456)
      ** (Ecto.NoResultsError)

  """
  def get_about!(id), do: Repo.get!(About, id)

  @doc """
  Creates a about.

  ## Examples

      iex> create_about(%{field: value})
      {:ok, %About{}}

      iex> create_about(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_about(attrs \\ %{}) do
    %About{}
    |> About.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a about.

  ## Examples

      iex> update_about(about, %{field: new_value})
      {:ok, %About{}}

      iex> update_about(about, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_about(%About{} = about, attrs) do
    about
    |> About.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a about.

  ## Examples

      iex> delete_about(about)
      {:ok, %About{}}

      iex> delete_about(about)
      {:error, %Ecto.Changeset{}}

  """
  def delete_about(%About{} = about) do
    Repo.delete(about)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking about changes.

  ## Examples

      iex> change_about(about)
      %Ecto.Changeset{data: %About{}}

  """
  def change_about(%About{} = about, attrs \\ %{}) do
    About.changeset(about, attrs)
  end
end
