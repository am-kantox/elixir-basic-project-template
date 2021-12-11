defmodule Kv.Test do
  use ExUnit.Case, async: false

  doctest Kv

  setup_all do
    {:ok, pid} = Kv.start_link()
    on_exit fn -> GenServer.stop(pid, :normal) end
    [pid: pid]
  end

  test "show it", %{pid: pid} do
    IO.inspect(pid, label: "Context")
    assert %{} == Kv.state(pid)
  end
end
