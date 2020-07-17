defmodule ORY.Hydra.Helpers.BodyTest do
  use ExUnit.Case, async: true

  alias ORY.Hydra.{ Config, Helpers, Operation }

  test "encode!/2" do
    assert "" == Helpers.Body.encode!(%Operation{ method: :get, params: %{ ok: true } }, Config.new(%{}))

    assert "{\"ok\":true}" == Helpers.Body.encode!(%Operation{ method: :post, params: %{ ok: true } }, Config.new(%{}))

    assert "{\"ok\":true}" == Helpers.Body.encode!(%Operation{ method: :post, params: %{ ok: true, not_ok: false }, params_in_query: [:not_ok] }, Config.new(%{}))
  end

  test "encode!/2 when :content_type is :form_urlencoded" do
    assert "ok%3Dtrue" == Helpers.Body.encode!(%Operation{ content_type: :form_urlencoded, method: :post, params: %{ ok: true } }, Config.new(%{}))
  end

  test "encode!/2 when :content_type is :json" do
    assert "{\"ok\":true}" == Helpers.Body.encode!(%Operation{ content_type: :json, method: :post, params: %{ ok: true } }, Config.new(%{}))
  end
end
