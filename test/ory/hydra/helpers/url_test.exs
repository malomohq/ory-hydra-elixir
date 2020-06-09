defmodule ORY.Hydra.Helpers.URLTest do
  use ExUnit.Case, async: true

  alias ORY.Hydra.{ Config, Helpers, Operation }

  @url "https://orhyhost.com"

  test "to_string/2 for GET requests" do
    operation = %Operation{ method: :get, path: "/hi", params: %{ good: "morning" } }

    assert "#{@url}/hi?good=morning" == Helpers.URL.to_string(operation, Config.new(%{ url: @url }))
  end

  test "to_string/2 for all other request types" do
    operation = %Operation{ method: :post, path: "/hi", params: %{ good: "morning", how: "are you?" }, params_in_query: [:how] }

    assert "#{@url}/hi?how=are+you%3F" == Helpers.URL.to_string(operation, Config.new(%{ url: @url }))
  end
end
