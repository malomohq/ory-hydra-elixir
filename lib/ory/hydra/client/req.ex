defmodule ORY.Hydra.Client.Req do
  @behaviour ORY.Hydra.Client

  @spec request(
          ORY.Hydra.http_method_t(),
          String.t(),
          ORY.Hydra.http_headers_t(),
          String.t(),
          any
        ) :: { :ok, ORY.Hydra.Client.response_t() } | { :error, any }
  def request(method, url, headers, body, _opts) do
    req = Req.new(
      method: method,
      url: url,
      headers: headers,
      body: body,
      decode_body: false # This is already handled elsewhere
    ) |> Req.request()

    package(req)
  end

  defp package({:ok, %Req.Response{ status: status_code, headers: headers, body: body }}) do
    response = %{ body: body, headers: headers, status_code: status_code }

    { :ok, response }
  end

  defp package(otherwise) do
    otherwise
  end
end
