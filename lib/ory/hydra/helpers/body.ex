defmodule ORY.Hydra.Helpers.Body do
  @spec encode!(ORY.Hydra.Operation.t(), ORY.Hydra.Config.t()) :: String.t() | no_return
  def encode!(%{method: :get}, _config) do
    ""
  end

  def encode!(%{content_type: :json} = operation, config) do
    operation.params
    |> Map.drop(operation.params_in_query)
    |> config.json_codec.encode!()
  end

  def encode!(%{content_type: :form_urlencoded} = operation, _config) do
    operation.params
    |> Map.drop(operation.params_in_query)
    |> URI.encode_query()
  end
end
