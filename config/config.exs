# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :quigley_malcolm,
  ecto_repos: [QuigleyMalcolm.Repo]

# Configures the endpoint
config :quigley_malcolm, QuigleyMalcolmWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Wsk372sAOQkJnyDr27QkLPKsUH6lexgVAOYAvSI9jHwg4u38MLHuJGAbpMhoTT1Z",
  render_errors: [view: QuigleyMalcolmWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: QuigleyMalcolm.PubSub,
  live_view: [signing_salt: "DEkoxxzm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
