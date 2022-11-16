defmodule ExauthWeb.FormControllerTest do
  use ExauthWeb.ConnCase

  import Exauth.FormsFixtures

  alias Exauth.Forms.Form

  @create_attrs %{
    placeholder: "some placeholder",
    required: "some required",
    title: "some title",
    type: "some type"
  }
  @update_attrs %{
    placeholder: "some updated placeholder",
    required: "some updated required",
    title: "some updated title",
    type: "some updated type"
  }
  @invalid_attrs %{placeholder: nil, required: nil, title: nil, type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all forms", %{conn: conn} do
      conn = get(conn, Routes.form_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create form" do
    test "renders form when data is valid", %{conn: conn} do
      conn = post(conn, Routes.form_path(conn, :create), form: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.form_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "placeholder" => "some placeholder",
               "required" => "some required",
               "title" => "some title",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.form_path(conn, :create), form: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update form" do
    setup [:create_form]

    test "renders form when data is valid", %{conn: conn, form: %Form{id: id} = form} do
      conn = put(conn, Routes.form_path(conn, :update, form), form: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.form_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "placeholder" => "some updated placeholder",
               "required" => "some updated required",
               "title" => "some updated title",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, form: form} do
      conn = put(conn, Routes.form_path(conn, :update, form), form: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete form" do
    setup [:create_form]

    test "deletes chosen form", %{conn: conn, form: form} do
      conn = delete(conn, Routes.form_path(conn, :delete, form))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.form_path(conn, :show, form))
      end
    end
  end

  defp create_form(_) do
    form = form_fixture()
    %{form: form}
  end
end
