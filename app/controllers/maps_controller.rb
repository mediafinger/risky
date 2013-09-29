class MapsController < ApplicationController
  before_filter :load_grid

  def risk_map
  end

  def risk_map2
  end

  # def select_attacking_troops
  # end

  # def select_neighbour
  # end


private

  def load_grid
    @map ||= Map.new(game)
    @grid = @map.grid
  end

  def game
    Game.find(params[:game])
  end

end
