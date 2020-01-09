defmodule ORY.Hydra.Operation do
  @type t ::
          %__MODULE__{
            method: ORY.Hydra.http_method_t(),
            params: map,
            path: String.t()
          }

  defstruct method: nil, params: %{}, path: nil
end
