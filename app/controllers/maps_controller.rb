class MapsController < ApplicationController

  before_filter :load_grid

  def ammap
  end

  def risk_map
  end

  def select_attacking_troops
  end

  def select_neighbour
  end



private

  def load_grid
    @map ||= Map.new(game)
    @grid = @map.grid
  end

  def game
    Game.find(params[:game])
  end

end
