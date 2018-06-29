defmodule ConfitWeb.PingControllerTest do
  use ConfitWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  def disable_duck_plug(_) do
    previous_app_env = Application.get_env(:confit, ConfitWeb.DuckPlug)
    new_app_env = Keyword.merge(previous_app_env, enabled: false)

    Application.put_env(:confit, ConfitWeb.DuckPlug, new_app_env)

    on_exit fn ->
      Application.put_env(:confit, ConfitWeb.DuckPlug, previous_app_env)
    end
  end

  def force_false_duck_plug(_) do
    previous_app_env = Application.get_env(:confit, ConfitWeb.DuckPlug)
    new_app_env = Keyword.merge(previous_app_env, force_false: true)

    Application.put_env(:confit, ConfitWeb.DuckPlug, new_app_env)

    on_exit fn ->
      Application.put_env(:confit, ConfitWeb.DuckPlug, previous_app_env)
    end
  end

  describe "index" do
    test "returns a false ducked pong by default", %{conn: conn} do
      conn = get conn, ping_path(conn, :index)
      assert json_response(conn, 200) == %{
        "duck" => false,
        "pong" => true
      }
    end

    test "returns a true ducked pong if set to true", %{conn: conn} do
      conn = get conn, ping_path(conn, :index), %{"duck" => "true"}
      assert json_response(conn, 200) == %{
        "duck" => true,
        "pong" => true
      }

    end

    test "returns a false ducked pong if set to false", %{conn: conn} do
      conn = get conn, ping_path(conn, :index), %{"duck" => "false"}
      assert json_response(conn, 200) == %{
        "duck" => false,
        "pong" => true
      }
    end
  end

  describe "with the duck plug forced to return false" do
    setup :force_false_duck_plug

    test "returns a false ducked pong if set to true", %{conn: conn} do
      conn = get conn, ping_path(conn, :index), %{"duck" => "true"}
      assert json_response(conn, 200) == %{
        "duck" => false,
        "pong" => true
      }

    end
  end

  describe "with the duck plug disabled" do
    setup :disable_duck_plug

    test "returns a lone pong", %{conn: conn} do
      conn = get conn, ping_path(conn, :index)
      assert json_response(conn, 200) == %{
        "pong" => true
      }
    end
  end
end
