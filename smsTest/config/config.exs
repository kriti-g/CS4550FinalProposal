# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :smsTest,
  ecto_repos: [SmsTest.Repo]

# Configures the endpoint
config :smsTest, SmsTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2jAdFIpCXYPaXW7hfCgOIZ/xUHU49h0DpTvsqw7LcTnUFuZ5R3DOKZe4F01/Wbr4",
  render_errors: [view: SmsTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SmsTest.PubSub,
  live_view: [signing_salt: "V3RTN+9U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
