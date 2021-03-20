defmodule HtmlLocationExperiment.Cache do
  use GenServer


  def start_link(default) when is_map(default) do
    IO.puts __MODULE__
    GenServer.start_link(__MODULE__, default, name: __MODULE__)
  end

  @impl true
  def init(state) do 
    schedule_clean()
    {:ok, state}
  end

  @impl true
  def handle_cast({:insert, id, loc}, state) do
    {:noreply, Map.put(state, id, loc)}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:new_id, _from, state) do
    id = "User" <> Integer.to_string(state[:id])
    state = Map.put(state, :id, state[:id] + 1)
    {:reply, id, state}
  end

  @impl true
  def handle_info(:clean, state) do
    new_state = state
                |> Enum.reject(fn {k, v} -> if k != :id do v["timestamp"] - :os.system_time(:milli_seconds) > 1000 else false end end)
                |> Map.new
    schedule_clean()
    {:noreply, new_state}
  end

  defp schedule_clean do
    Process.send_after(self(), :clean, 2 * 1000)
  end 
end
