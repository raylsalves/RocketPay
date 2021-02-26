defmodule RocketWeb.UsersController do
  use RocketWeb, :controller
  alias Rocket.User

  action_fallback RocketWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocket.create_user() do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

end
