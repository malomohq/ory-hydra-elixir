defmodule ORY.Hydra.Helpers.URL do
  @moduledoc false

  alias ORY.Hydra.{ Config, Operation }

  @spec to_string(Operation.t(), Config.t()) :: String.t()
  def to_string(operation, config) do
    operation
    |> to_uri(config)
    |> URI.to_string()
  end

  @spec to_uri(Operation.t(), Config.t()) :: URI.t()
  def to_uri(operation, config) do
    URI.parse(config.url)
    |> Map.put(:path, operation.path)
    |> put_query(operation)
  end

  #
  # private
  #

  defp put_query(uri, %{ method: :get } = operation) do
    Map.put(uri, :query, URI.encode_query(operation.params))
  end

  defp put_query(uri, _operation) do
    uri
  end
end
