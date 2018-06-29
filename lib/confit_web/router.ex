defmodule ConfitWeb.Router do
  use ConfitWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConfitWeb do
    pipe_through :api
  end
end
