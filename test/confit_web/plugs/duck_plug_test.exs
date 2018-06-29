defmodule DuckPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "it assigns duck: true if true duck param is given" do
    in_conn = conn(:get, "/", %{"duck" => "true"})
    out_conn = ConfitWeb.DuckPlug.call(in_conn, %{})
    assert out_conn.assigns[:duck] == true
  end

  test "it assigns duck: false if false duck param is given" do
    in_conn = conn(:get, "/", %{"duck" => "false"})
    out_conn = ConfitWeb.DuckPlug.call(in_conn, %{})
    assert out_conn.assigns[:duck] == false
  end

  test "it assigns duck: false if no duck param is given" do
    in_conn = conn(:get, "/", %{})
    out_conn = ConfitWeb.DuckPlug.call(in_conn, %{})
    assert out_conn.assigns[:duck] == false
  end
end
