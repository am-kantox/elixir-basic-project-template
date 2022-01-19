defmodule Kv.Behaviour do
  @moduledoc "Behaviour"

  @version "1.0.0"

  @type key :: atom()
  @type value :: any()
  @typedoc "Key-Value Type"
  @type kv :: %{optional(key()) => value()}

  @doc """
  Returns the state of the project.

  Version: #{@version}.
  """
  @callback state(GenServer.name()) :: kv()
  @doc "Puts the element into Kv store under the name given as the second parameter"
  @callback put(GenServer.name(), key(), value()) :: :ok
  @doc "Get the element from Kv store"
  @callback get(GenServer.name(), key()) :: value()
end
