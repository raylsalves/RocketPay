defmodule Rocket do
  alias Rocket.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
