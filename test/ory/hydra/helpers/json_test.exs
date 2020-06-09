defmodule ORY.Hydra.Helpers.JSONTest do
  use ExUnit.Case, async: true

  alias ORY.Hydra.{ Config, Helpers }

  test "decode/2" do
    assert %{ "ok" => true } = Helpers.JSON.decode("{\"ok\":true}", Config.new(%{}))

    assert "💩" == Helpers.JSON.decode("💩", Config.new(%{}))
  end
end
