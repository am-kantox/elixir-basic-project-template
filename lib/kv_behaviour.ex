defmodule Kv.Behaviour do
  @moduledoc false

  @typedoc "Key-value storage"
  @type kv :: %{optional(any()) => any()}

  @doc """
  Returns the state
  """
  @callback state(GenServer.name()) :: kv()
  @callback put(GenServer.name(), any(), any()) :: :ok
  @callback get(GenServer.name(), any()) :: any()
end
