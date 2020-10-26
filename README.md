# ORY.Hydra

ORY Hydra is an open source OAuth 2.0 and OpenID Connect 1.0 provider. This
project provides an Elixir client for interacting with ORY Hydra's
administrative REST API.

For additional information about ORY Hydra please refer to their
[official documentation](https://www.ory.sh/docs/hydra/).

Also, please refer to ORY Hydra's
[developer documentation](https://www.ory.sh/docs/) for details on individual
API endpoints. This project does not intend to maintain implementation details
for ORY Hydra itself.

## Installation

ORY.Hydra is published on [Hex](https://hex.pm/packages/ory_hydra). Add it to
your list of dependencies in `mix.exs`:

```elixir
defp deps do
  { :ory_hydra, "~> 1.2" }
end
```

ORY.Hydra requires you to provide an HTTP client and a JSON codec. `hackney`
and `jason` are used by default. If you wish to use these defaults you will need
to specify `hackney` and `jason` as dependencies as well.

## Usage

ORY.Hydra implements all administrative REST API endpoints. For details on
functions supporting individual endpoints please refer to our
[documentation](https://hexdocs.pm/ory_hydra/).

### Example

```elixir
operation = ORY.Hydra.get_consent_request(%{ consent_challenge: "xxx" })

ORY.Hydra.request(operation, %{ url: "https://hydra.yourdomain.com:4445" })
```

## Configuration

All configuration must be provided on a per-request basis as a map to the second
argument of `ORY.Hydra.request/2`.

Possible configuration values are provided below:

* `:headers` - additional HTTP headers sent with a request. ORY.Hydra will
  always supply a `Content-Type` of `application/json`. Defaults to `[]`.
* `:http_client` - HTTP client to use when making requests. Defaults to
  `ORY.Hydra.Client.Hackney`.
* `:http_client_opts` - any options you want passed to the configured HTTP
  client when a request is made. Defaults to `[]`.
* `:json_codec` - JSON codec to use when encoding/decoding request and response
  bodies. Defaults to `Jason`.
* `:retry` - whether to retry a request when a status code of 500 is recevied or
  a client error occurs (e.g. timeout). Defaults to `false`.
* `:retry_opts` - options for configuring retry behavior. Defaults to `[]`.
  * `:max_attempts` - the number of attempts to make before failing a request.
    Defaults to `3`.
* `:url` - URL to issue HTTP requests to. Typically contains a port number.
