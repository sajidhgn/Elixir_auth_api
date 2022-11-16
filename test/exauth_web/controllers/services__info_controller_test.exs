defmodule ExauthWeb.Services_InfoControllerTest do
  use ExauthWeb.ConnCase

  import Exauth.Services_InfosFixtures

  alias Exauth.Services_Infos.Services_Info

  @create_attrs %{
    info: "some info"
  }
  @update_attrs %{
    info: "some updated info"
  }
  @invalid_attrs %{info: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all services_infos", %{conn: conn} do
      conn = get(conn, Routes.services__info_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create services__info" do
    test "renders services__info when data is valid", %{conn: conn} do
      conn = post(conn, Routes.services__info_path(conn, :create), services__info: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.services__info_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "info" => "some info"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.services__info_path(conn, :create), services__info: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update services__info" do
    setup [:create_services__info]

    test "renders services__info when data is valid", %{conn: conn, services__info: %Services_Info{id: id} = services__info} do
      conn = put(conn, Routes.services__info_path(conn, :update, services__info), services__info: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.services__info_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "info" => "some updated info"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, services__info: services__info} do
      conn = put(conn, Routes.services__info_path(conn, :update, services__info), services__info: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete services__info" do
    setup [:create_services__info]

    test "deletes chosen services__info", %{conn: conn, services__info: services__info} do
      conn = delete(conn, Routes.services__info_path(conn, :delete, services__info))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.services__info_path(conn, :show, services__info))
      end
    end
  end

  defp create_services__info(_) do
    services__info = services__info_fixture()
    %{services__info: services__info}
  end
end
