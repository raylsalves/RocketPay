defmodule Rocket.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Rocket.Repo,
      # Start the Telemetry supervisor
      RocketWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rocket.PubSub},
      # Start the Endpoint (http/https)
      RocketWeb.Endpoint
      # Start a worker by calling: Rocket.Worker.start_link(arg)
      # {Rocket.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rocket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RocketWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
