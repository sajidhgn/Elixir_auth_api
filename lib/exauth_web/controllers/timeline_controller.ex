defmodule ExauthWeb.TimelineController do
  use ExauthWeb, :controller

  alias Exauth.Timelines
  alias Exauth.Timelines.Timeline

  action_fallback ExauthWeb.FallbackController

  def index(conn, _params) do
    timelines = Timelines.list_timelines()
    render(conn, "index.json", timelines: timelines)
  end

  def create(conn, %{"timeline" => timeline_params}) do
    with {:ok, %Timeline{} = timeline} <- Timelines.create_timeline(timeline_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ExauthWeb.Router.Helpers.timeline_path(conn, :show, timeline))
      |> render("show.json", timeline: timeline)
    end
  end

  def show(conn, %{"id" => id}) do
    timeline = Timelines.get_timeline!(id)
    render(conn, "show.json", timeline: timeline)
  end

  def update(conn, %{"id" => id, "timeline" => timeline_params}) do
    timeline = Timelines.get_timeline!(id)

    with {:ok, %Timeline{} = timeline} <- Timelines.update_timeline(timeline, timeline_params) do
      render(conn, "show.json", timeline: timeline)
    end
  end

  def delete(conn, %{"id" => id}) do
    timeline = Timelines.get_timeline!(id)

    with {:ok, %Timeline{}} <- Timelines.delete_timeline(timeline) do
      send_resp(conn, :no_content, "")
    end
  end
end
