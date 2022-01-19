defmodule Kv do
  @moduledoc """
  Key-Value store naïve implementation
  """

  use GenServer

  @behaviour Kv.Behaviour

  @doc """
  Starts a process
  """
  @spec start_link([{:name, atom()}]) :: GenServer.on_start()
  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, %{}, Keyword.take(opts, [:name]))

  @impl GenServer
  def init(%{}), do: {:ok, %{}}

  @doc """
  Returns the whole storage

  ## Tests

      iex> with {:ok, pid} <- Kv.start_link(), :ok <- Kv.put(pid, :foo, 42), do: Kv.get(pid, :foo)
      42
  """
  @impl Kv.Behaviour
  def state(name), do: GenServer.call(name, :state)

  @spec put_default(GenServer.name(), Kv.Behaviour.value()) :: :ok
  def put_default(name, value),
    do: put(name, "default", value)

  @doc """
  Puts the value to the storage
  """
  @impl Kv.Behaviour
  def put(name, key, value), do: GenServer.cast(name, {:put, key, value})

  @doc """
  Gets the value from the storage
  """
  @impl Kv.Behaviour
  def get(name, key), do: GenServer.call(name, {:get, key})

  @doc false
  @impl GenServer
  def handle_call(:state, _from, state),
    do: {:reply, state, state}

  @doc false
  @impl GenServer
  def handle_call({:get, key}, _from, state),
    do: {:reply, state[key], state}

  @doc false
  @impl GenServer
  def handle_cast({:put, key, value}, state),
    do: {:noreply, Map.put(state, key, value)}
end
