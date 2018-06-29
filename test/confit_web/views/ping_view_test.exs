defmodule ConfitWeb.PingViewTest do
  use ConfitWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders index.json without a duck field" do
    assert render(ConfitWeb.PingView, "index.json", %{}) ==
      %{
        pong: true
      }
  end

  test "renders index.json with a true duck field" do
    assert render(ConfitWeb.PingView, "index.json", %{duck: true}) ==
      %{
        duck: true,
        pong: true
      }
  end

  test "renders index.json with a false duck field" do
    assert render(ConfitWeb.PingView, "index.json", %{duck: false}) ==
      %{
        duck: false,
        pong: true
      }
  end
end
