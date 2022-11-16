defmodule ExauthWeb.TimelineView do
  use ExauthWeb, :view
  alias ExauthWeb.TimelineView

  def render("index.json", %{timelines: timelines}) do
    %{data: render_many(timelines, TimelineView, "timeline.json")}
  end

  def render("show.json", %{timeline: timeline}) do
    %{data: render_one(timeline, TimelineView, "timeline.json")}
  end

  def render("timeline.json", %{timeline: timeline}) do
    %{
      id: timeline.id,
      title: timeline.title,
      detail: timeline.detail,
      year: timeline.year
    }
  end
end
