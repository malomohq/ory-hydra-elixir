defmodule ORY.Hydra.Helpers.Headers do
  @spec content_type(ORY.Hydra.Operation.t()) :: String.t()
  def content_type(%{ content_type: :form_urlencoded }) do
    "application/x-www-form-urlencoded"
  end

  def content_type(%{ content_type: :json }) do
    "application/json"
  end
end
