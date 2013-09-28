class MapsController < ApplicationController
  def ammap
  end

  def risk_map
    @grid = Map.grid
  end
end
