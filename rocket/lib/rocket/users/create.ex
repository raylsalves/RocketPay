defmodule Rocket.Users.Create do
  alias Rocket.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
