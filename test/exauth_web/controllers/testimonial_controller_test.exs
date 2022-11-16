defmodule ExauthWeb.TestimonialControllerTest do
  use ExauthWeb.ConnCase

  import Exauth.TestimonialsFixtures

  alias Exauth.Testimonials.Testimonial

  @create_attrs %{
    designation: "some designation",
    detail: "some detail",
    image: "some image",
    name: "some name"
  }
  @update_attrs %{
    designation: "some updated designation",
    detail: "some updated detail",
    image: "some updated image",
    name: "some updated name"
  }
  @invalid_attrs %{designation: nil, detail: nil, image: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all testimonials", %{conn: conn} do
      conn = get(conn, Routes.testimonial_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create testimonial" do
    test "renders testimonial when data is valid", %{conn: conn} do
      conn = post(conn, Routes.testimonial_path(conn, :create), testimonial: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.testimonial_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "designation" => "some designation",
               "detail" => "some detail",
               "image" => "some image",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.testimonial_path(conn, :create), testimonial: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update testimonial" do
    setup [:create_testimonial]

    test "renders testimonial when data is valid", %{conn: conn, testimonial: %Testimonial{id: id} = testimonial} do
      conn = put(conn, Routes.testimonial_path(conn, :update, testimonial), testimonial: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.testimonial_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "designation" => "some updated designation",
               "detail" => "some updated detail",
               "image" => "some updated image",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, testimonial: testimonial} do
      conn = put(conn, Routes.testimonial_path(conn, :update, testimonial), testimonial: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete testimonial" do
    setup [:create_testimonial]

    test "deletes chosen testimonial", %{conn: conn, testimonial: testimonial} do
      conn = delete(conn, Routes.testimonial_path(conn, :delete, testimonial))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.testimonial_path(conn, :show, testimonial))
      end
    end
  end

  defp create_testimonial(_) do
    testimonial = testimonial_fixture()
    %{testimonial: testimonial}
  end
end
