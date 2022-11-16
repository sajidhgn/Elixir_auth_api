defmodule ExauthWeb.AboutView do
  use ExauthWeb, :view

  def render("about.json", %{success: success, message: message}), do: %{success: success, message: message}
  def render("errors.json", %{errors: errors}), do: %{errors: errors}
  def render("error.json", %{error: error}), do: %{error: error}


  # Get List
  def render("list.json", %{list: list}), do: %{list: list}

  # Get By Id
  def render("edit.json", %{data: data}), do: %{data: data}
# Update Data
  def render("update.json", %{data: data}), do: %{data: data}
end
