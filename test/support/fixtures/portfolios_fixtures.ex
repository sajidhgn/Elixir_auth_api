defmodule Exauth.PortfoliosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exauth.Portfolios` context.
  """

  @doc """
  Generate a portfolio.
  """
  def portfolio_fixture(attrs \\ %{}) do
    {:ok, portfolio} =
      attrs
      |> Enum.into(%{
        image: "some image",
        title: "some title"
      })
      |> Exauth.Portfolios.create_portfolio()

    portfolio
  end
end
