defmodule Exauth.Timelines do
  @moduledoc """
  The Timelines context.
  """

  import Ecto.Query, warn: false
  alias Exauth.Repo

  alias Exauth.Timelines.Timeline

  @doc """
  Returns the list of timelines.

  ## Examples

      iex> list_timelines()
      [%Timeline{}, ...]

  """
  def list_timelines do
    Repo.all(Timeline)
  end

  @doc """
  Gets a single timeline.

  Raises `Ecto.NoResultsError` if the Timeline does not exist.

  ## Examples

      iex> get_timeline!(123)
      %Timeline{}

      iex> get_timeline!(456)
      ** (Ecto.NoResultsError)

  """
  def get_timeline!(id), do: Repo.get!(Timeline, id)

  @doc """
  Creates a timeline.

  ## Examples

      iex> create_timeline(%{field: value})
      {:ok, %Timeline{}}

      iex> create_timeline(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_timeline(attrs \\ %{}) do
    %Timeline{}
    |> Timeline.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a timeline.

  ## Examples

      iex> update_timeline(timeline, %{field: new_value})
      {:ok, %Timeline{}}

      iex> update_timeline(timeline, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_timeline(%Timeline{} = timeline, attrs) do
    timeline
    |> Timeline.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a timeline.

  ## Examples

      iex> delete_timeline(timeline)
      {:ok, %Timeline{}}

      iex> delete_timeline(timeline)
      {:error, %Ecto.Changeset{}}

  """
  def delete_timeline(%Timeline{} = timeline) do
    Repo.delete(timeline)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking timeline changes.

  ## Examples

      iex> change_timeline(timeline)
      %Ecto.Changeset{data: %Timeline{}}

  """
  def change_timeline(%Timeline{} = timeline, attrs \\ %{}) do
    Timeline.changeset(timeline, attrs)
  end
end
