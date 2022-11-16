defmodule Exauth.Skills_InfosTest do
  use Exauth.DataCase

  alias Exauth.Skills_Infos

  describe "skills_infos" do
    alias Exauth.Skills_Infos.Skills_Info

    import Exauth.Skills_InfosFixtures

    @invalid_attrs %{detail: nil, title: nil}

    test "list_skills_infos/0 returns all skills_infos" do
      skills__info = skills__info_fixture()
      assert Skills_Infos.list_skills_infos() == [skills__info]
    end

    test "get_skills__info!/1 returns the skills__info with given id" do
      skills__info = skills__info_fixture()
      assert Skills_Infos.get_skills__info!(skills__info.id) == skills__info
    end

    test "create_skills__info/1 with valid data creates a skills__info" do
      valid_attrs = %{detail: "some detail", title: "some title"}

      assert {:ok, %Skills_Info{} = skills__info} = Skills_Infos.create_skills__info(valid_attrs)
      assert skills__info.detail == "some detail"
      assert skills__info.title == "some title"
    end

    test "create_skills__info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Skills_Infos.create_skills__info(@invalid_attrs)
    end

    test "update_skills__info/2 with valid data updates the skills__info" do
      skills__info = skills__info_fixture()
      update_attrs = %{detail: "some updated detail", title: "some updated title"}

      assert {:ok, %Skills_Info{} = skills__info} = Skills_Infos.update_skills__info(skills__info, update_attrs)
      assert skills__info.detail == "some updated detail"
      assert skills__info.title == "some updated title"
    end

    test "update_skills__info/2 with invalid data returns error changeset" do
      skills__info = skills__info_fixture()
      assert {:error, %Ecto.Changeset{}} = Skills_Infos.update_skills__info(skills__info, @invalid_attrs)
      assert skills__info == Skills_Infos.get_skills__info!(skills__info.id)
    end

    test "delete_skills__info/1 deletes the skills__info" do
      skills__info = skills__info_fixture()
      assert {:ok, %Skills_Info{}} = Skills_Infos.delete_skills__info(skills__info)
      assert_raise Ecto.NoResultsError, fn -> Skills_Infos.get_skills__info!(skills__info.id) end
    end

    test "change_skills__info/1 returns a skills__info changeset" do
      skills__info = skills__info_fixture()
      assert %Ecto.Changeset{} = Skills_Infos.change_skills__info(skills__info)
    end
  end
end
