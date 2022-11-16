defmodule ExauthWeb.Social_iconControllerTest do
  use ExauthWeb.ConnCase

  import Exauth.Social_IconsFixtures

  alias Exauth.Social_Icons.Social_icon

  @create_attrs %{
    link: "some link",
    name: "some name"
  }
  @update_attrs %{
    link: "some updated link",
    name: "some updated name"
  }
  @invalid_attrs %{link: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all social_icons", %{conn: conn} do
      conn = get(conn, Routes.social_icon_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create social_icon" do
    test "renders social_icon when data is valid", %{conn: conn} do
      conn = post(conn, Routes.social_icon_path(conn, :create), social_icon: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.social_icon_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "link" => "some link",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.social_icon_path(conn, :create), social_icon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update social_icon" do
    setup [:create_social_icon]

    test "renders social_icon when data is valid", %{conn: conn, social_icon: %Social_icon{id: id} = social_icon} do
      conn = put(conn, Routes.social_icon_path(conn, :update, social_icon), social_icon: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.social_icon_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "link" => "some updated link",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, social_icon: social_icon} do
      conn = put(conn, Routes.social_icon_path(conn, :update, social_icon), social_icon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete social_icon" do
    setup [:create_social_icon]

    test "deletes chosen social_icon", %{conn: conn, social_icon: social_icon} do
      conn = delete(conn, Routes.social_icon_path(conn, :delete, social_icon))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.social_icon_path(conn, :show, social_icon))
      end
    end
  end

  defp create_social_icon(_) do
    social_icon = social_icon_fixture()
    %{social_icon: social_icon}
  end
end
