defmodule ORY.Hydra.Helpers.URL do
  @spec to_string(ORY.Hydra.Operation.t(), ORY.Hydra.Config.t()) :: String.t()
  def to_string(operation, config) do
    URI.parse(config.url)
    |> Map.put(:path, operation.path)
    |> put_query(operation)
    |> URI.to_string()
  end

  defp put_query(uri, %{ method: :get } = operation) do
    Map.put(uri, :query, URI.encode_query(operation.params))
  end

  defp put_query(uri, operation) do
    params = operation.params
    params = Map.take(params, operation.params_in_query)
    params = URI.encode_query(params)

    Map.put(uri, :query, params)
  end
end
