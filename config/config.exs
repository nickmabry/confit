# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :confit, ConfitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6qacD4gn3ORuvhaXXctUxEzeVk0vILXJLNUJiKy2Hjk90EQpOCf10/5KkmcLM4MM",
  render_errors: [view: ConfitWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Confit.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
