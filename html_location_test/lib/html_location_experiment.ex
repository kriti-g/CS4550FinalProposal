defmodule HtmlLocationExperiment do
  @moduledoc """
  HtmlLocationExperiment keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # Spherical law of cosines
  def get_distance(one, two) do
    m = :math.pi / 180
    la1 = one["latitude"] * m
    la2 = two["latitude"] * m
    lo = (two["longitude"] - one["longitude"]) * m
    r = 63710
    :math.acos((:math.sin(la1) * :math.sin(la2)) + (:math.cos(la1) * :math.cos(la2) * :math.cos(lo))) * r
  end

  def get_key(kone, ktwo) do
    kone <> " to " <> ktwo
  end

  defp calc_distances_helper(_locations, []) do
    []
  end

  defp calc_distances_helper(locations, [khead | ktail]) do
    distances = Enum.map(ktail, fn k -> {get_key(khead, k), get_distance(locations[khead], locations[k])} end) 
    distances ++ calc_distances_helper(locations, ktail)
  end

  def calc_distances(locations) do
    IO.puts "calc_distances"
    IO.inspect locations
    Enum.into(calc_distances_helper(locations, Map.keys(locations)), %{})
  end
end
