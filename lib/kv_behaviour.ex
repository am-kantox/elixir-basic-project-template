defmodule Kv.Behaviour do
  @doc """
  Returns the state
  """
  @callback state(GenServer.name()) :: Kv.kv()
  @callback put(GenServer.name(), any(), any()) :: :ok
  @callback get(GenServer.name(), any()) :: any()
end
