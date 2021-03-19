defmodule HtmlLocationExperimentWeb.DistanceLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(HtmlLocationExperimentWeb.PageView, "index.html", assigns)
  end

  def mount(_params, _args, socket) do
    distances = GenServer.call(Elixir.HtmlLocationExperiment.Cache, :state) 
                |> Map.drop([:id])
                |> HtmlLocationExperiment.calc_distances
    {:ok, assign(socket, :distances, distances)}
  end
end
