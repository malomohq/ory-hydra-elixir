defmodule ORY.Hydra.Config do
  @type t ::
          %__MODULE__{
            headers: ORY.Hydra.http_headers_t(),
            http_client: module,
            http_client_opts: any,
            json_codec: module,
            retry: boolean,
            retry_opts: Keyword.t(),
            url: String.t()
          }

  defstruct headers: [],
            http_client: ORY.Hydra.Client.Hackney,
            http_client_opts: [],
            json_codec: Jason,
            retry: false,
            retry_opts: [],
            url: nil
end
