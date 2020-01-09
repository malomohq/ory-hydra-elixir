defmodule ORY.Hydra.Client do
  @type response_t ::
          %{
            body: String.t(),
            headers: ORY.Hydra.http_headers_t(),
            status_code: pos_integer
          }

  @callback request(
              method :: ORY.Hydra.http_method_t(),
              url :: String.t(),
              headers :: ORY.Hydra.http_headers_t(),
              body :: String.t(),
              opts :: any
            ) :: { :ok, response_t() } | { :error, any }
end
