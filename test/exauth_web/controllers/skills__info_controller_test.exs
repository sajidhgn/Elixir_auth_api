defmodule ExauthWeb.Skills_InfoControllerTest do
  use ExauthWeb.ConnCase

  import Exauth.Skills_InfosFixtures

  alias Exauth.Skills_Infos.Skills_Info

  @create_attrs %{
    detail: "some detail",
    title: "some title"
  }
  @update_attrs %{
    detail: "some updated detail",
    title: "some updated title"
  }
  @invalid_attrs %{detail: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all skills_infos", %{conn: conn} do
      conn = get(conn, Routes.skills__info_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create skills__info" do
    test "renders skills__info when data is valid", %{conn: conn} do
      conn = post(conn, Routes.skills__info_path(conn, :create), skills__info: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.skills__info_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "detail" => "some detail",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.skills__info_path(conn, :create), skills__info: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update skills__info" do
    setup [:create_skills__info]

    test "renders skills__info when data is valid", %{conn: conn, skills__info: %Skills_Info{id: id} = skills__info} do
      conn = put(conn, Routes.skills__info_path(conn, :update, skills__info), skills__info: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.skills__info_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "detail" => "some updated detail",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, skills__info: skills__info} do
      conn = put(conn, Routes.skills__info_path(conn, :update, skills__info), skills__info: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete skills__info" do
    setup [:create_skills__info]

    test "deletes chosen skills__info", %{conn: conn, skills__info: skills__info} do
      conn = delete(conn, Routes.skills__info_path(conn, :delete, skills__info))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.skills__info_path(conn, :show, skills__info))
      end
    end
  end

  defp create_skills__info(_) do
    skills__info = skills__info_fixture()
    %{skills__info: skills__info}
  end
end
