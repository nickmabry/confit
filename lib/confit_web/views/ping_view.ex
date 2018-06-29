defmodule ConfitWeb.PingView do
  use ConfitWeb, :view

  def render("index.json", %{duck: duck}) do
    %{
      duck: duck,
      pong: true
    }
  end

  def render("index.json", _) do
    %{
      pong: true
    }
  end
end
