defmodule Exauth.ServicesTest do
  use Exauth.DataCase

  alias Exauth.Services

  describe "services" do
    alias Exauth.Services.Service

    import Exauth.ServicesFixtures

    @invalid_attrs %{detail: nil, icon: nil, title: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Services.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Services.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{detail: "some detail", icon: "some icon", title: "some title"}

      assert {:ok, %Service{} = service} = Services.create_service(valid_attrs)
      assert service.detail == "some detail"
      assert service.icon == "some icon"
      assert service.title == "some title"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Services.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{detail: "some updated detail", icon: "some updated icon", title: "some updated title"}

      assert {:ok, %Service{} = service} = Services.update_service(service, update_attrs)
      assert service.detail == "some updated detail"
      assert service.icon == "some updated icon"
      assert service.title == "some updated title"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Services.update_service(service, @invalid_attrs)
      assert service == Services.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Services.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Services.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Services.change_service(service)
    end
  end
end
