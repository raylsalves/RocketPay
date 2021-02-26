defmodule RocketWeb.FallbackController do
  use RocketWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
