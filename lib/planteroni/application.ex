defmodule Planteroni.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @token Application.compile_env!(:planteroni, :telegram_token)

  @impl true
  def start(_type, _args) do
    bot_config = [
      token: @token,
      max_bot_concurrency: 1
    ]

    children = [
      # Start the Telemetry supervisor
      PlanteroniWeb.Telemetry,
      # Start the Ecto repository
      Planteroni.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Planteroni.PubSub},
      # Start Finch
      {Finch, name: Planteroni.Finch},
      # Start the Endpoint (http/https)
      PlanteroniWeb.Endpoint,
      # Start a worker by calling: Planteroni.Worker.start_link(arg)
      # {Planteroni.Worker, arg}
      {Telegram.Poller, bots: [{Planteroni.Bot.Bot, bot_config}]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Planteroni.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PlanteroniWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
