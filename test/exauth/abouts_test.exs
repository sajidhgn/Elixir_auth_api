defmodule Exauth.AboutsTest do
  use Exauth.DataCase

  alias Exauth.Abouts

  describe "abouts" do
    alias Exauth.Abouts.About

    import Exauth.AboutsFixtures

    @invalid_attrs %{about_detail: nil, designation: nil, hire_link: nil, name: nil, portfolio_link: nil, profile: nil}

    test "list_abouts/0 returns all abouts" do
      about = about_fixture()
      assert Abouts.list_abouts() == [about]
    end

    test "get_about!/1 returns the about with given id" do
      about = about_fixture()
      assert Abouts.get_about!(about.id) == about
    end

    test "create_about/1 with valid data creates a about" do
      valid_attrs = %{about_detail: "some about_detail", designation: "some designation", hire_link: "some hire_link", name: "some name", portfolio_link: "some portfolio_link", profile: "some profile"}

      assert {:ok, %About{} = about} = Abouts.create_about(valid_attrs)
      assert about.about_detail == "some about_detail"
      assert about.designation == "some designation"
      assert about.hire_link == "some hire_link"
      assert about.name == "some name"
      assert about.portfolio_link == "some portfolio_link"
      assert about.profile == "some profile"
    end

    test "create_about/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Abouts.create_about(@invalid_attrs)
    end

    test "update_about/2 with valid data updates the about" do
      about = about_fixture()
      update_attrs = %{about_detail: "some updated about_detail", designation: "some updated designation", hire_link: "some updated hire_link", name: "some updated name", portfolio_link: "some updated portfolio_link", profile: "some updated profile"}

      assert {:ok, %About{} = about} = Abouts.update_about(about, update_attrs)
      assert about.about_detail == "some updated about_detail"
      assert about.designation == "some updated designation"
      assert about.hire_link == "some updated hire_link"
      assert about.name == "some updated name"
      assert about.portfolio_link == "some updated portfolio_link"
      assert about.profile == "some updated profile"
    end

    test "update_about/2 with invalid data returns error changeset" do
      about = about_fixture()
      assert {:error, %Ecto.Changeset{}} = Abouts.update_about(about, @invalid_attrs)
      assert about == Abouts.get_about!(about.id)
    end

    test "delete_about/1 deletes the about" do
      about = about_fixture()
      assert {:ok, %About{}} = Abouts.delete_about(about)
      assert_raise Ecto.NoResultsError, fn -> Abouts.get_about!(about.id) end
    end

    test "change_about/1 returns a about changeset" do
      about = about_fixture()
      assert %Ecto.Changeset{} = Abouts.change_about(about)
    end
  end
end
