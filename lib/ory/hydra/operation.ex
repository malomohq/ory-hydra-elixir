defmodule ORY.Hydra.Operation do
  @type t ::
          %__MODULE__{
            method: ORY.Hydra.http_method_t(),
            params: map,
            params_in_query: list(atom),
            path: String.t()
          }

  defstruct method: nil, params: %{}, params_in_query: [], path: nil
end
