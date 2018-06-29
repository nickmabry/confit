defmodule ConfitWeb.Router do
  use ConfitWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug ConfitWeb.DuckPlug
  end

  scope "/", ConfitWeb do
    pipe_through :api
    get "/", PingController, :index
  end
end
