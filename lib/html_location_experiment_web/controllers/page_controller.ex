defmodule HtmlLocationExperimentWeb.PageController do
  use HtmlLocationExperimentWeb, :controller

  import Phoenix.LiveView.Controller

  def index(conn, _params) do
    live_render(conn, HtmlLocationExperimentWeb.DistanceLive)
  end
end
