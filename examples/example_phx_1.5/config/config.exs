# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :example,
  ecto_repos: [Example.Repo]

config :thesis, :dynamic_pages,
  view: ExampleWeb.PageView,
  template: ["dynamic.html"],
  not_found_view: ExampleWeb.ErrorView,
  not_found_template: "404.html"

# Configures the endpoint
config :example, ExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1uVHKrO7lmb6j9YgVrvk+HyRxfMYWWVMDQMibBWq4Dxe9fXD+qJwUU9tU/kiblOe",
  render_errors: [view: ExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Example.PubSub,
  live_view: [signing_salt: "6WEM3Bxf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Thesis Main Config
config :thesis,
  store: Thesis.EctoStore,
  authorization: Example.ThesisAuth,
  uploader: Thesis.RepoUploader

# Thesis Store Config
config :thesis, Thesis.EctoStore, repo: Example.Repo

# Thesis Notifications Config
# config :thesis, :notifications,
#   add_page: [],
#   page_settings: [],
#   import_export_restore: []

# Thesis Dynamic Pages Config
# config :thesis, :dynamic_pages,
#   view: ExampleWeb.PageView,
#   templates: ["index.html", "otherview.html"],
#   not_found_view: ExampleWeb.ErrorView,
#   not_found_template: "404.html"
