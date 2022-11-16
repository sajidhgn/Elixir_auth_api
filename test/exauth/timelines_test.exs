defmodule Exauth.TimelinesTest do
  use Exauth.DataCase

  alias Exauth.Timelines

  describe "timelines" do
    alias Exauth.Timelines.Timeline

    import Exauth.TimelinesFixtures

    @invalid_attrs %{detail: nil, title: nil, year: nil}

    test "list_timelines/0 returns all timelines" do
      timeline = timeline_fixture()
      assert Timelines.list_timelines() == [timeline]
    end

    test "get_timeline!/1 returns the timeline with given id" do
      timeline = timeline_fixture()
      assert Timelines.get_timeline!(timeline.id) == timeline
    end

    test "create_timeline/1 with valid data creates a timeline" do
      valid_attrs = %{detail: "some detail", title: "some title", year: "some year"}

      assert {:ok, %Timeline{} = timeline} = Timelines.create_timeline(valid_attrs)
      assert timeline.detail == "some detail"
      assert timeline.title == "some title"
      assert timeline.year == "some year"
    end

    test "create_timeline/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timelines.create_timeline(@invalid_attrs)
    end

    test "update_timeline/2 with valid data updates the timeline" do
      timeline = timeline_fixture()
      update_attrs = %{detail: "some updated detail", title: "some updated title", year: "some updated year"}

      assert {:ok, %Timeline{} = timeline} = Timelines.update_timeline(timeline, update_attrs)
      assert timeline.detail == "some updated detail"
      assert timeline.title == "some updated title"
      assert timeline.year == "some updated year"
    end

    test "update_timeline/2 with invalid data returns error changeset" do
      timeline = timeline_fixture()
      assert {:error, %Ecto.Changeset{}} = Timelines.update_timeline(timeline, @invalid_attrs)
      assert timeline == Timelines.get_timeline!(timeline.id)
    end

    test "delete_timeline/1 deletes the timeline" do
      timeline = timeline_fixture()
      assert {:ok, %Timeline{}} = Timelines.delete_timeline(timeline)
      assert_raise Ecto.NoResultsError, fn -> Timelines.get_timeline!(timeline.id) end
    end

    test "change_timeline/1 returns a timeline changeset" do
      timeline = timeline_fixture()
      assert %Ecto.Changeset{} = Timelines.change_timeline(timeline)
    end
  end
end
