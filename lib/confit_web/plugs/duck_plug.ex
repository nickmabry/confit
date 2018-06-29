defmodule ConfitWeb.DuckPlug do
  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    if enabled?() do
      duck_was_found = duck_encountered?(conn)
      Plug.Conn.assign(conn, :duck, duck_was_found)
    else
      conn
    end
  end

  defp app_env do
    Application.get_env(:confit, ConfitWeb.DuckPlug, [])
  end

  defp duck_encountered?(%{"params": params}) do
    if force_false?() do
      false
    else
      case params["duck"] do
        "true" -> true
        _ -> false
      end
    end
  end

  defp enabled? do
    app_env()[:enabled]
  end

  defp force_false? do
    app_env()[:force_false]
  end
end
