use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :confit, ConfitWeb.Endpoint,
  http: [port: 4001],
  server: false

config :confit, :duck_plug, ConfitWeb.DuckPlugMock

# Print only warnings and errors during test
config :logger, level: :warn
