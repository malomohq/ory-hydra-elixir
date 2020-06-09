defmodule ORY.Hydra.Helpers.BodyTest do
  use ExUnit.Case, async: true

  alias ORY.Hydra.{ Config, Helpers, Operation }

  test "encode!/2" do
    assert "" == Helpers.Body.encode!(%Operation{ method: :get, params: %{ ok: true } }, Config.new(%{}))

    assert "{\"ok\":true}" == Helpers.Body.encode!(%Operation{ method: :post, params: %{ ok: true } }, Config.new(%{}))

    assert "{\"ok\":true}" == Helpers.Body.encode!(%Operation{ method: :post, params: %{ ok: true, not_ok: false }, params_in_query: [:not_ok] }, Config.new(%{}))
  end
end
