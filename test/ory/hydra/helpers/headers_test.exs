defmodule ORY.Hydra.Helpers.HeadersTest do
  use ExUnit.Case, async: true

  alias ORY.Hydra.{ Helpers, Operation }

  test "content_type/1 when :content_type is :form_urlencoded" do
    assert "application/x-www-form-urlencoded" == Helpers.Headers.content_type(%Operation{ content_type: :form_urlencoded })
  end

  test "content_type/1 when :content_type is :json" do
    assert "application/json" == Helpers.Headers.content_type(%Operation{ content_type: :json })
  end
end
