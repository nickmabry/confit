defmodule ConfitWeb.PingControllerTest do
  use ConfitWeb.ConnCase
  import Mox

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index - under standard configuration" do
    setup do
      stub(ConfitWeb.DuckPlugMock, :call, &ConfitWeb.DuckPlug.call/2)
    end

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

  @tag :skip
  describe "index - with the duck plug forced to return false" do
    setup :force_false_duck_plug

    test "returns a false ducked pong if set to true", %{conn: conn} do
      conn = get conn, ping_path(conn, :index), %{"duck" => "true"}
      assert json_response(conn, 200) == %{
        "duck" => false,
        "pong" => true
      }

    end
  end

  @tag :skip
  describe "index - with the duck plug disabled" do
    setup :disable_duck_plug

    test "returns a lone pong", %{conn: conn} do
      conn = get conn, ping_path(conn, :index)
      assert json_response(conn, 200) == %{
        "pong" => true
      }
    end
  end
end
