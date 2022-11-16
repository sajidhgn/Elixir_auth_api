defmodule Exauth.FormsTest do
  use Exauth.DataCase

  alias Exauth.Forms

  describe "forms" do
    alias Exauth.Forms.Form

    import Exauth.FormsFixtures

    @invalid_attrs %{placeholder: nil, required: nil, title: nil, type: nil}

    test "list_forms/0 returns all forms" do
      form = form_fixture()
      assert Forms.list_forms() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Forms.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{placeholder: "some placeholder", required: "some required", title: "some title", type: "some type"}

      assert {:ok, %Form{} = form} = Forms.create_form(valid_attrs)
      assert form.placeholder == "some placeholder"
      assert form.required == "some required"
      assert form.title == "some title"
      assert form.type == "some type"
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{placeholder: "some updated placeholder", required: "some updated required", title: "some updated title", type: "some updated type"}

      assert {:ok, %Form{} = form} = Forms.update_form(form, update_attrs)
      assert form.placeholder == "some updated placeholder"
      assert form.required == "some updated required"
      assert form.title == "some updated title"
      assert form.type == "some updated type"
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_form(form, @invalid_attrs)
      assert form == Forms.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Forms.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Forms.change_form(form)
    end
  end
end
