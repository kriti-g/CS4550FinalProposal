defmodule HtmlLocationExperiment.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start cache
      {HtmlLocationExperiment.Cache, %{id: 0}},
      # Start the Telemetry supervisor
      HtmlLocationExperimentWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HtmlLocationExperiment.PubSub},
      # Start the Endpoint (http/https)
      HtmlLocationExperimentWeb.Endpoint
      # Start a worker by calling: HtmlLocationExperiment.Worker.start_link(arg)
      # {HtmlLocationExperiment.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HtmlLocationExperiment.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HtmlLocationExperimentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
