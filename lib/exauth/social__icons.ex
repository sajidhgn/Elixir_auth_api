defmodule Exauth.Social_Icons do
  @moduledoc """
  The Social_Icons context.
  """

  import Ecto.Query, warn: false
  alias Exauth.Repo

  alias Exauth.Social_Icons.Social_icon

  @doc """
  Returns the list of social_icons.

  ## Examples

      iex> list_social_icons()
      [%Social_icon{}, ...]

  """
  def list_social_icons do
    Repo.all(Social_icon)
  end

  @doc """
  Gets a single social_icon.

  Raises `Ecto.NoResultsError` if the Social icon does not exist.

  ## Examples

      iex> get_social_icon!(123)
      %Social_icon{}

      iex> get_social_icon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_social_icon!(id), do: Repo.get!(Social_icon, id)

  @doc """
  Creates a social_icon.

  ## Examples

      iex> create_social_icon(%{field: value})
      {:ok, %Social_icon{}}

      iex> create_social_icon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_social_icon(attrs \\ %{}) do
    %Social_icon{}
    |> Social_icon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a social_icon.

  ## Examples

      iex> update_social_icon(social_icon, %{field: new_value})
      {:ok, %Social_icon{}}

      iex> update_social_icon(social_icon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_social_icon(%Social_icon{} = social_icon, attrs) do
    social_icon
    |> Social_icon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a social_icon.

  ## Examples

      iex> delete_social_icon(social_icon)
      {:ok, %Social_icon{}}

      iex> delete_social_icon(social_icon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_social_icon(%Social_icon{} = social_icon) do
    Repo.delete(social_icon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking social_icon changes.

  ## Examples

      iex> change_social_icon(social_icon)
      %Ecto.Changeset{data: %Social_icon{}}

  """
  def change_social_icon(%Social_icon{} = social_icon, attrs \\ %{}) do
    Social_icon.changeset(social_icon, attrs)
  end
end
