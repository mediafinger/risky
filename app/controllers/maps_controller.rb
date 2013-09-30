class MapsController < ApplicationController
  before_filter :load_grid

  def risk_map
    puts "XXX: #{params.inspect}"

    @pool = true if current_player.pool > 0
  end

  def risk_map2
  end

  def risk_map3
  end

  def select_attacking_troops
    @select_troops = Country.part_of(game).where(id: params[:country_id]).first.army.size - 1
    @attacking_country = Country.part_of(game).where(id: params[:country_id]).first

    render "risk_map"
  end

  def select_country_to_attack
    puts "XXX: #{params.inspect}"
    country_id = params["country_id"].first[0]

    attacker = current_player.countries.where(id: params[:attacking_country]).first
    defender = Country.part_of(game).where(id: country_id).first
    troops   = params[:troops].to_i

    conflict = Conflict.new(attacker, defender)
    @victory = false
    attacker_army_size = attacker.army.size

    while !@victory && troops > 1
      @victory = conflict.attack(troops)
      troops -= attacker_army_size - attacker.army.size
    end

    # TODO how to prevent caching of old country data and color?
    @occupied_country = country_id if @victory
    render "risk_map"
  end

  def next_player
    game.next_player
    @pool = true if current_player.pool > 0

    render "risk_map"
  end

  def draft_troops
    country = current_player.countries.part_of(@game).where(id: params[:country_id]).first
    country.army.add_one
    @pool = true if current_player.pool > 0

    render "risk_map"
  end

private

  def load_grid
    @map ||= Map.new(game)
    @grid = @map.grid
  end

  def game
    @game ||= Game.find(params[:game])
  end

  def current_player
    game.players.where(active: true).first
  end
end
