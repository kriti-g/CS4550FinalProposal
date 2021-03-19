defmodule HtmlLocationExperimentWeb.General do
  use HtmlLocationExperimentWeb, :channel

  @impl true
  def join("general:" <> _name, _payload, socket) do
    id = GenServer.call(Elixir.HtmlLocationExperiment.Cache, :new_id)
    {:ok, assign(socket, :user_id, id)}
  end

  @impl true
  def handle_in("location", loc, socket) do
    GenServer.cast(Elixir.HtmlLocationExperiment.Cache, {:insert, socket.assigns[:user_id], loc})
    {:reply, :ok, socket}
  end

end
