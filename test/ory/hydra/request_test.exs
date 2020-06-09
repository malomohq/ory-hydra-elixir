defmodule ORY.Hydra.RequestTest do
  use ExUnit.Case, async: true

  alias ORY.Hydra.{ Config, Operation, Request, Response }

  setup do
    bypass = Bypass.open()

    config = %Config{ url: "http://localhost:#{bypass.port}" }

    operation = %Operation{ method: :post, params: %{ var: "a" }, path: "/fake" }

    %{ bypass: bypass, config: config, operation: operation}
  end

  describe "send/3" do
    test "returns { :ok, %ORY.Hydra.Response{} } when response has an HTTP status code of 200", tags do
      bypass = Map.get(tags, :bypass)

      config = Map.get(tags, :config)

      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn(conn) -> Plug.Conn.send_resp(conn, 200, "{\"ok\":true}") end)

      assert { :ok, %Response{} } = Request.send(operation, config)
    end

    test "returns { :error, %ORY.Hydra.Response{} } when response has an HTTP status code of 400", tags do
      bypass = Map.get(tags, :bypass)

      config = Map.get(tags, :config)

      operation = Map.get(tags, :operation)

      Bypass.expect(bypass, fn(conn) -> Plug.Conn.send_resp(conn, 400, "{\"ok\":false}") end)

      assert { :error, %Response{} } = Request.send(operation, config)
    end
  end
end
