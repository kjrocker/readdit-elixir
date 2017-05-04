# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :readdit,
  ecto_repos: [Readdit.Repo]

# Configures the endpoint
config :readdit, Readdit.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gH/0wZIep1wX5UOHxDjWQZBInie/kKwlIT/rUfWVAO5B2HUX2qr5xxA8ZHMp+GZi",
  render_errors: [view: Readdit.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Readdit.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
