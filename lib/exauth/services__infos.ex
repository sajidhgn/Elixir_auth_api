defmodule Exauth.Services_Infos do
  @moduledoc """
  The Services_Infos context.
  """

  import Ecto.Query, warn: false
  alias Exauth.Repo

  alias Exauth.Services_Infos.Services_Info

  @doc """
  Returns the list of services_infos.

  ## Examples

      iex> list_services_infos()
      [%Services_Info{}, ...]

  """
  def list_services_infos do
    Repo.all(Services_Info)
  end

  @doc """
  Gets a single services__info.

  Raises `Ecto.NoResultsError` if the Services  info does not exist.

  ## Examples

      iex> get_services__info!(123)
      %Services_Info{}

      iex> get_services__info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_services__info!(id), do: Repo.get!(Services_Info, id)

  @doc """
  Creates a services__info.

  ## Examples

      iex> create_services__info(%{field: value})
      {:ok, %Services_Info{}}

      iex> create_services__info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_services__info(attrs \\ %{}) do
    %Services_Info{}
    |> Services_Info.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a services__info.

  ## Examples

      iex> update_services__info(services__info, %{field: new_value})
      {:ok, %Services_Info{}}

      iex> update_services__info(services__info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_services__info(%Services_Info{} = services__info, attrs) do
    services__info
    |> Services_Info.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a services__info.

  ## Examples

      iex> delete_services__info(services__info)
      {:ok, %Services_Info{}}

      iex> delete_services__info(services__info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_services__info(%Services_Info{} = services__info) do
    Repo.delete(services__info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking services__info changes.

  ## Examples

      iex> change_services__info(services__info)
      %Ecto.Changeset{data: %Services_Info{}}

  """
  def change_services__info(%Services_Info{} = services__info, attrs \\ %{}) do
    Services_Info.changeset(services__info, attrs)
  end
end
