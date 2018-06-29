defmodule ConfitWeb.PingController do
  use ConfitWeb, :controller

  action_fallback ConfitWeb.FallbackController

  def index(conn, _params) do
    opts = if Map.has_key?(conn.assigns, :duck) do
      %{duck: Map.fetch!(conn.assigns, :duck)}
    else
      %{}
    end
    render(conn, "index.json", opts)
  end
end
