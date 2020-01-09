defmodule ORY.Hydra.Helpers.JSON do
  @moduledoc false

  @spec decode(String.t(), ORY.Hydra.Config.t()) :: map
  def decode(string, config) do
    case config.json_codec.decode(string) do
      { :ok, result } ->
        result
      { :error, _reason } ->
        %{}
    end
  end

  @spec encode(map, ORY.Hydra.Config.t()) :: String.t()
  def encode(map, config) do
    case config.json_codec.encode(map) do
      { :ok, result } ->
        result
      { :error, _reason } ->
        ""
    end
  end
end
