defmodule ConfitWeb.Router do
  use ConfitWeb, :router

  @duck_plug Application.get_env(:confit, :duck_plug, ConfitWeb.DuckPlug)

  pipeline :api do
    plug :accepts, ["json"]
    plug @duck_plug
  end

  scope "/", ConfitWeb do
    pipe_through :api
    get "/", PingController, :index
  end
end
