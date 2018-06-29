defmodule ConfitWeb.DuckPlug do
  @callback init(any()) :: any()
  @callback call(any(), any()) :: any()

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    duck_was_found = duck_encountered?(conn)
    Plug.Conn.assign(conn, :duck, duck_was_found)
  end

  defp duck_encountered?(%{"params": params}) do
    case params["duck"] do
      "true" -> true
      _ -> false
    end
  end
end
