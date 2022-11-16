defmodule ExauthWeb.Utils do
  import Ecto.Changeset

  @interal_server_error "Internal Server Error"
  @invalid_credentials "Invalid Credentials"

  def internal_server_error, do: @interal_server_error
  def invalid_credentials, do: @invalid_credentials

  def format_changeset_errors(%Ecto.Changeset{} = changeset) do

    errors =
       traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)
       end)

       formated_errors =
       Enum.map(errors, fn {key, value} ->
        formated_error = "#{key} #{value}"
        formated_error
       end)

       formated_errors
  end
end
