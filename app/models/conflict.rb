class NoBorderException < StandardError
end

class CanNotAttackYourselfException < StandardError
end

class NotEnoughTroopsException < StandardError
end

class Conflict
  def initialize(attacking_country, defending_country)
    raise NoBorderException unless attacking_country.neighbours.include? defending_country.name
    raise CanNotAttackYourselfException unless attacking_country.player_id != defending_country.player_id

    @attacker = attacking_country
    @defender = defending_country

    Notificator.put "#{@attacker.name} (#{@attacker.player.name}) does not like #{@defender.name} (#{@defender.player.name})"
  end

  def attack(troops)
    raise NotEnoughTroopsException unless @attacker.army.size > troops
    Notificator.put "Attacking with #{troops}"

    @attacker.dices = dices([troops, 3].min)
    @defender.dices = dices([@defender.army.size, 2].min)

    calculate_losses
    take_country(troops)

    # return value true if the attacker occupied the other country
    Notificator.put "------------------------"
    @defender.player_id == @attacker.player.id
  end

  def dices(count)
    dices = []

    for x in 0..count-1 do
      dices[x] = rand(1..6)
      x += 1
    end

    dices
  end

  def calculate_losses
    losses_attacker = losses_defender = 0
    attack_rounds = (@attacker.dices[1] > 0 && @defender.dices[1] > 0) ? 2 : 1

    for x in 0..(attack_rounds - 1) do
      Notificator.put("#{@attacker.dices[x]} vs #{@defender.dices[x]}")
      if @attacker.dices[x] > @defender.dices[x]
        losses_defender += 1
      else
        losses_attacker += 1
      end

      x += 1
    end

    reduce_army(@defender.army, losses_defender)
    reduce_army(@attacker.army, losses_attacker)  # return value = attacker's army
  end

  def reduce_army(army, count)
    Notificator.put "#{army.player.name} lost #{count}"
    army.update_attributes(size: army.size - count) || (army.destroy and @defender.reload and Notificator.put("Army of #{army.country.name} DESTROYED"))
  end

  def take_country(troops)
    return if @defender.army

    occupying_forces = [troops, @attacker.army.size - 1].min
    defending_player_name = @defender.player.name

    Player.transaction do
      @defender.update_attributes!(player_id: @attacker.player_id)
      @attacker.army.update_attributes!(size: @attacker.army.size - occupying_forces)
      Army.create!(player: @attacker.player, country_id: @defender.id, size: occupying_forces)
      @attacker.player.update_attributes(new_cards: @attacker.player.new_cards + 1)
      Notificator.put "#{@attacker.player.name} beats #{defending_player_name} and occupies #{@defender.name} with #{occupying_forces} armies from #{@attacker.name}"
    end

    @defender.region.change_owner(@defender.player)
  end

end
