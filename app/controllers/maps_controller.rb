class MapsController < ApplicationController
  def ammap
  end

  def risk_map
    map = Map.new()
    @grid = map.grid
  end
end
