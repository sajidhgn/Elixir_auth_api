defmodule ExauthWeb.FormView do
  use ExauthWeb, :view
  alias ExauthWeb.FormView

  def render("index.json", %{forms: forms}) do
    %{data: render_many(forms, FormView, "form.json")}
  end

  def render("show.json", %{form: form}) do
    %{data: render_one(form, FormView, "form.json")}
  end

  def render("form.json", %{form: form}) do
    %{
      id: form.id,
      title: form.title,
      type: form.type,
      placeholder: form.placeholder,
      required: form.required
    }
  end
end
