defmodule Exauth.Social_IconsTest do
  use Exauth.DataCase

  alias Exauth.Social_Icons

  describe "social_icons" do
    alias Exauth.Social_Icons.Social_icon

    import Exauth.Social_IconsFixtures

    @invalid_attrs %{link: nil, name: nil}

    test "list_social_icons/0 returns all social_icons" do
      social_icon = social_icon_fixture()
      assert Social_Icons.list_social_icons() == [social_icon]
    end

    test "get_social_icon!/1 returns the social_icon with given id" do
      social_icon = social_icon_fixture()
      assert Social_Icons.get_social_icon!(social_icon.id) == social_icon
    end

    test "create_social_icon/1 with valid data creates a social_icon" do
      valid_attrs = %{link: "some link", name: "some name"}

      assert {:ok, %Social_icon{} = social_icon} = Social_Icons.create_social_icon(valid_attrs)
      assert social_icon.link == "some link"
      assert social_icon.name == "some name"
    end

    test "create_social_icon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social_Icons.create_social_icon(@invalid_attrs)
    end

    test "update_social_icon/2 with valid data updates the social_icon" do
      social_icon = social_icon_fixture()
      update_attrs = %{link: "some updated link", name: "some updated name"}

      assert {:ok, %Social_icon{} = social_icon} = Social_Icons.update_social_icon(social_icon, update_attrs)
      assert social_icon.link == "some updated link"
      assert social_icon.name == "some updated name"
    end

    test "update_social_icon/2 with invalid data returns error changeset" do
      social_icon = social_icon_fixture()
      assert {:error, %Ecto.Changeset{}} = Social_Icons.update_social_icon(social_icon, @invalid_attrs)
      assert social_icon == Social_Icons.get_social_icon!(social_icon.id)
    end

    test "delete_social_icon/1 deletes the social_icon" do
      social_icon = social_icon_fixture()
      assert {:ok, %Social_icon{}} = Social_Icons.delete_social_icon(social_icon)
      assert_raise Ecto.NoResultsError, fn -> Social_Icons.get_social_icon!(social_icon.id) end
    end

    test "change_social_icon/1 returns a social_icon changeset" do
      social_icon = social_icon_fixture()
      assert %Ecto.Changeset{} = Social_Icons.change_social_icon(social_icon)
    end
  end
end
