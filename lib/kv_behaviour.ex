defmodule Kv.Behaviour do
  @moduledoc false

  @doc """
  Returns the state
  """
  @callback state(GenServer.name()) :: Kv.kv()
  @callback put(GenServer.name(), any(), any()) :: :ok
  @callback get(GenServer.name(), any()) :: any()
end
