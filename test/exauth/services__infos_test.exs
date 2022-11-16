defmodule Exauth.Services_InfosTest do
  use Exauth.DataCase

  alias Exauth.Services_Infos

  describe "services_infos" do
    alias Exauth.Services_Infos.Services_Info

    import Exauth.Services_InfosFixtures

    @invalid_attrs %{info: nil}

    test "list_services_infos/0 returns all services_infos" do
      services__info = services__info_fixture()
      assert Services_Infos.list_services_infos() == [services__info]
    end

    test "get_services__info!/1 returns the services__info with given id" do
      services__info = services__info_fixture()
      assert Services_Infos.get_services__info!(services__info.id) == services__info
    end

    test "create_services__info/1 with valid data creates a services__info" do
      valid_attrs = %{info: "some info"}

      assert {:ok, %Services_Info{} = services__info} = Services_Infos.create_services__info(valid_attrs)
      assert services__info.info == "some info"
    end

    test "create_services__info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Services_Infos.create_services__info(@invalid_attrs)
    end

    test "update_services__info/2 with valid data updates the services__info" do
      services__info = services__info_fixture()
      update_attrs = %{info: "some updated info"}

      assert {:ok, %Services_Info{} = services__info} = Services_Infos.update_services__info(services__info, update_attrs)
      assert services__info.info == "some updated info"
    end

    test "update_services__info/2 with invalid data returns error changeset" do
      services__info = services__info_fixture()
      assert {:error, %Ecto.Changeset{}} = Services_Infos.update_services__info(services__info, @invalid_attrs)
      assert services__info == Services_Infos.get_services__info!(services__info.id)
    end

    test "delete_services__info/1 deletes the services__info" do
      services__info = services__info_fixture()
      assert {:ok, %Services_Info{}} = Services_Infos.delete_services__info(services__info)
      assert_raise Ecto.NoResultsError, fn -> Services_Infos.get_services__info!(services__info.id) end
    end

    test "change_services__info/1 returns a services__info changeset" do
      services__info = services__info_fixture()
      assert %Ecto.Changeset{} = Services_Infos.change_services__info(services__info)
    end
  end
end
