defmodule Exauth.Skills_Infos do
  @moduledoc """
  The Skills_Infos context.
  """

  import Ecto.Query, warn: false
  alias Exauth.Repo

  alias Exauth.Skills_Infos.Skills_Info

  @doc """
  Returns the list of skills_infos.

  ## Examples

      iex> list_skills_infos()
      [%Skills_Info{}, ...]

  """
  def list_skills_infos do
    Repo.all(Skills_Info)
  end

  @doc """
  Gets a single skills__info.

  Raises `Ecto.NoResultsError` if the Skills  info does not exist.

  ## Examples

      iex> get_skills__info!(123)
      %Skills_Info{}

      iex> get_skills__info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skills__info!(id), do: Repo.get!(Skills_Info, id)

  @doc """
  Creates a skills__info.

  ## Examples

      iex> create_skills__info(%{field: value})
      {:ok, %Skills_Info{}}

      iex> create_skills__info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skills__info(attrs \\ %{}) do
    %Skills_Info{}
    |> Skills_Info.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skills__info.

  ## Examples

      iex> update_skills__info(skills__info, %{field: new_value})
      {:ok, %Skills_Info{}}

      iex> update_skills__info(skills__info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skills__info(%Skills_Info{} = skills__info, attrs) do
    skills__info
    |> Skills_Info.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skills__info.

  ## Examples

      iex> delete_skills__info(skills__info)
      {:ok, %Skills_Info{}}

      iex> delete_skills__info(skills__info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skills__info(%Skills_Info{} = skills__info) do
    Repo.delete(skills__info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skills__info changes.

  ## Examples

      iex> change_skills__info(skills__info)
      %Ecto.Changeset{data: %Skills_Info{}}

  """
  def change_skills__info(%Skills_Info{} = skills__info, attrs \\ %{}) do
    Skills_Info.changeset(skills__info, attrs)
  end
end
