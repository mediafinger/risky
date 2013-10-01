class MapsController < ApplicationController
  respond_to :html
  before_filter :load_grid

  def risk_map
    puts "XXX: #{params.inspect}"

    @player_hint = "Risky!"
    @pool = true if current_player.pool > 0
  end

  def show_nearby_enemies
    @attacking_country = Country.part_of(game).belonging_to(current_player).where(id: params[:country_id]).first
    @select_troops = @attacking_country.army.size - 1

    @player_hint = "To attack with the army of #{@attacking_country.name} :<br /> 1. Select the number of troops<br />2. select the neighbouring enemy you want to attack".html_safe
    render "risk_map"
  end

  def attack_country
    puts "XXX: #{params.inspect}"
    country_id = params["country_id"].first[0]

    attacker = current_player.countries.where(id: params[:attacking_country]).first
    defender = Country.part_of(game).where(id: country_id).first
    troops   = params[:troops].to_i

    conflict = Conflict.new(attacker, defender)
    @victory = false
    attacker_army_size = attacker.army.size

    while !@victory && troops > 0
      @victory            = conflict.attack(troops)
      troops             -= attacker_army_size - attacker.army.size
      attacker_army_size  = attacker.army.size
    end

    if @victory
      @player_hint = "#{attacker.name} attacked #{defender.name}<br />and invaded it with #{defender.reload.army.size} troops.<br />Keep rollin'!".html_safe
    else
      @player_hint = "#{attacker.name} attacked #{defender.name}<br />and lost #{params[:troops]} troops.<br />Don't give up!".html_safe
    end

    @occupied_country = country_id if @victory
    render "risk_map"
  end

  def end_turn
    @distribution_phase = true

    @player_hint = "Move your troops!<br />Select one army to start with.".html_safe
    render "risk_map"
  end

  def show_nearby_friends
    @distribution_phase = true
    @distributing_country = Country.part_of(game).belonging_to(current_player).where(id: params[:country_id]).first
    @troops_to_move = @distributing_country.army.size - 1

    @player_hint = "To move troops from #{@distributing_country.name} :<br /> 1. Select the number of troops<br />2. select one of your neighbouring countries".html_safe
    render "risk_map"
  end

  def move_troops
    @distribution_phase = true
    country_id = params["country_id"].first[0]

    country_from = current_player.countries.part_of(@game).where(id: params[:country_from]).first
    country_to   = current_player.countries.part_of(@game).where(id: country_id).first
    troops       = params[:troops].to_i

    country_from.army.move_to(country_to, troops)

    @player_hint = "Moved #{troops} troops from #{country_from.name} to #{country_to.name}.<br />Keep moving!".html_safe
    render "risk_map"
  end

  def next_player
    game.next_player
    current_player.reload.countries.reload

    current_players_regions = current_player.regions.part_of(game).pluck(:name)
    if current_players_regions.length >= game.regions_to_win
      @player_hint = "<span style='background-color: #{current_player.color}; font-weight: bold;'>&nbsp;#{current_player.name}&nbsp;</span><br />holds this regions occupied:<br />#{current_players_regions.join('<br />')}<br />and wins the game.<br /><br />CONGRATULATIONS!".html_safe
      @game_over = true
      render "risk_map"
    else
      @pool = true if current_player.pool > 0

      @player_hint = "It's <span style='background-color: #{current_player.color}; font-weight: bold;'>&nbsp;#{current_player.name}&nbsp;</span>'s turn!<br />You get #{current_player.pool} new troops<br />click on your countries to distribute them.".html_safe
      render "risk_map"
    end
  end

  def draft_troops
    country = current_player.countries.part_of(@game).where(id: params[:country_id]).first
    country.army.add_one
    if current_player.pool > 0
      @pool = true
      @player_hint = "Added one army to #{country.name}<br />#{current_player.pool} more left.".html_safe
    else
      @player_hint = "Select the country you want to attack from!"
    end
    render "risk_map"
  end

# Alternative Maps
  def risk_map2
  end

  def risk_map3
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
