defmodule ORY.Hydra do
  alias ORY.Hydra.{ Config, Operation, Request, Response }

  @type http_headers_t :: [{ String.t(), String.t() }]

  @type http_method_t :: :delete | :get | :post | :put

  @type response_t :: { :ok, Response.t() } | { :error, Response.t() | any }

  @doc """
  Accept a consent request.
  """
  @spec accept_consent_request(map) :: Operation.t()
  def accept_consent_request(params) do
    %Operation{
      method: :put,
      params: params,
      path: "/oauth2/auth/requests/consent/accept"
    }
  end

  @doc """
  Accept a login request.
  """
  @spec accept_login_request(map) :: Operation.t()
  def accept_login_request(params) do
    %Operation{
      method: :put,
      params: params,
      path: "/oauth2/auth/requests/login/accept"
    }
  end

  @doc """
  Accepts a logout request.
  """
  @spec accept_logout_request(map) :: Operation.t()
  def accept_logout_request(params) do
    %Operation{
      method: :put,
      params: params,
      path: "/oauth2/auth/requests/logout/accept"
    }
  end

  @doc """
  Check whether an ORY Hydra service is alive.
  """
  @spec check_alive :: Operation.t()
  def check_alive do
    %Operation{
      method: :get,
      path: "/health/alive"
    }
  end

  @doc """
  Create an OAuth 2.0 client.
  """
  @spec create_client(map) :: Operation.t()
  def create_client(params \\ %{}) do
    %Operation{
      method: :post,
      params: params,
      path: "/clients"
    }
  end

  @doc """
  Delete an OAuth 2.0 client.
  """
  @spec delete_client(String.t()) :: Operation.t()
  def delete_client(id) do
    %Operation{
      method: :delete,
      path: "/clients/#{id}"
    }
  end

  @doc """
  Delete a JSON Web Key.
  """
  @spec delete_jwk(String.t(), String.t()) :: Operation.t()
  def delete_jwk(set, kid) do
    %Operation{
      method: :delete,
      path: "/keys/#{set}/#{kid}"
    }
  end

  @doc """
  Delete a JSON Web Key set.
  """
  @spec delete_jwk_set(String.t()) :: Operation.t()
  def delete_jwk_set(set) do
    %Operation{
      method: :delete,
      path: "/keys/#{set}"
    }
  end

  @doc """
  Delete expired OAuth2 access tokens.
  """
  @spec flush_expired_access_tokens(map) :: Operation.t()
  def flush_expired_access_tokens(params \\ %{}) do
    %Operation{
      method: :post,
      params: params,
      path: "/oauth2/flush"
    }
  end

  @doc """
  Generate a JSON Web Key set.
  """
  @spec generate_jwk_set(String.t(), map) :: Operation.t()
  def generate_jwk_set(set, params) do
    %Operation{
      method: :post,
      params: params,
      path: "/keys/#{set}"
    }
  end

  @doc """
  Retrieve an OAuth 2.0 client.
  """
  @spec get_client(String.t()) :: Operation.t()
  def get_client(id) do
    %Operation{
      method: :get,
      path: "/clients/#{id}"
    }
  end

  @doc """
  Retrieve consent request.
  """
  @spec get_consent_request(map) :: Operation.t()
  def get_consent_request(params) do
    %Operation{
      method: :get,
      params: params,
      path: "/oauth2/auth/requests/consent"
    }
  end

  @doc """
  Retrieve a JSON Web Key.
  """
  @spec get_jwk(String.t(), String.t()) :: Operation.t()
  def get_jwk(set, kid) do
    %Operation{
      method: :get,
      path: "/keys/#{set}/#{kid}"
    }
  end

  @doc """
  Retrieve a JSON Web Key set.
  """
  @spec get_jwk_set(String.t()) :: Operation.t()
  def get_jwk_set(set) do
    %Operation{
      method: :get,
      path: "/keys/#{set}"
    }
  end

  @doc """
  Retrieve login request.
  """
  @spec get_login_request(map) :: Operation.t()
  def get_login_request(params) do
    %Operation{
      method: :get,
      params: params,
      path: "/oauth2/auth/requests/login"
    }
  end

  @doc """
  Retrieve logout request.
  """
  @spec get_logout_request(map) :: Operation.t()
  def get_logout_request(params) do
    %Operation{
      method: :get,
      params: params,
      path: "/oauth2/auth/requests/logout"
    }
  end

  @doc """
  Retrieve a metric snapshot from an ORY Hydra service.
  """
  @spec get_metrics :: Operation.t()
  def get_metrics do
    %Operation{
      method: :get,
      path: "/metrics/prometheus"
    }
  end

  @doc """
  Retrieve the version of the ORY Hydra service.
  """
  @spec get_version :: Operation.t()
  def get_version do
    %Operation{
      method: :get,
      path: "/version"
    }
  end

  @doc """
  Check whether a token is active.
  """
  @spec introspect(map) :: Operation.t()
  def introspect(params) do
    %Operation{
      method: :post,
      params: params,
      path: "/oauth2/introspect"
    }
  end

  @doc """
  List all OAuth 2.0 clients.
  """
  @spec list_clients(map) :: Operation.t()
  def list_clients(params \\ %{}) do
    %Operation{
      method: :get,
      params: params,
      path: "/clients"
    }
  end

  @doc """
  List all consent sessions.
  """
  @spec list_consent_sessions(map) :: Operation.t()
  def list_consent_sessions(params) do
    %Operation{
      method: :get,
      params: params,
      path: "/oauth2/auth/sessions/consent"
    }
  end

  @doc """
  Reject a consent request.
  """
  @spec reject_consent_request(map) :: Operation.t()
  def reject_consent_request(params) do
    %Operation{
      method: :put,
      params: params,
      path: "/oauth2/auth/requests/consent/reject"
    }
  end

  @doc """
  Reject a login request.
  """
  @spec reject_login_request(map) :: Operation.t()
  def reject_login_request(params) do
    %Operation{
      method: :put,
      params: params,
      path: "/oauth2/auth/requests/login/reject"
    }
  end

  @doc """
  Reject a logout request.
  """
  @spec reject_logout_request(map) :: Operation.t()
  def reject_logout_request(params) do
    %Operation{
      method: :put,
      params: params,
      path: "/oauth2/auth/requests/logout/reject"
    }
  end

  @doc """
  Issue a request to the ORY Hydra administrative API.
  """
  @spec request(Operation.t(), map) :: response_t
  def request(operation, config) do
    Request.send(operation, Config.new(config), %{})
  end

  @doc """
  Revoke consent sessions.
  """
  @spec revoke_consent_sessions(map) :: Operation.t()
  def revoke_consent_sessions(params) do
    %Operation{
      method: :delete,
      params: params,
      path: "/oauth2/auth/sessions/consent"
    }
  end

  @doc """
  Revoke login sessions.
  """
  @spec revoke_login_sessions(map) :: Operation.t()
  def revoke_login_sessions(params) do
    %Operation{
      method: :delete,
      params: params,
      path: "/oauth2/auth/sessions/login"
    }
  end

  @doc """
  Update an OAuth 2.0 client.
  """
  @spec update_client(String.t(), map) :: Operation.t()
  def update_client(id, params) do
    %Operation{
      method: :put,
      params: params,
      path: "/clients/#{id}"
    }
  end

  @doc """
  Update a JSON Web Key.
  """
  @spec update_jwk(String.t(), String.t(), map) :: Operation.t()
  def update_jwk(set, kid, params) do
    %Operation{
      method: :put,
      params: params,
      path: "/keys/#{set}/#{kid}"
    }
  end

  @doc """
  Update a JSON Web Key set.
  """
  @spec update_jwk_set(String.t(), map) :: Operation.t()
  def update_jwk_set(set, params) do
    %Operation{
      method: :put,
      params: params,
      path: "/keys/#{set}"
    }
  end
end
