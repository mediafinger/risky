class NoBorderException < StandardError
end

class CanNotAttackYourselfException < StandardError
end

class NotEnoughTroopsException < StandardError
end

class Fight
  def initialize(attacking_country, defending_country)
    raise NoBorderException unless attacking_country.neighbours.include? defending_country.name
    raise CanNotAttackYourselfException unless attacking_country.player_id != defending_country.player_id

    @attacker = attacking_country
    @defender = defending_country
  end

  def fight(troops)
    raise NotEnoughTroopsException unless @attacker.army.size > troops

    @attacker.dices = dices(troops)
    @defender.dices = dices([@defender.army.size, 2].min)

    calculate_losses
    take_country(troops) if @defender.army.size <= 0

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
    puts "#{army.player.name} lost #{count}"
    army.update_attributes!(size: army.size - count)
  end

  def take_country(troops)
    puts "Defending army DESTROYED" if @defender.army.destroy!

    occupying_forces = [troops, @attacker.army.size - 1].min

    @defender.update_attributes!(player_id: @attacker.player_id)
    @attacker.army.update_attributes!(size: @attacker.army.size - occupying_forces)

    Army.create!(player: @attacker.player, country_id: @defender.id, size: occupying_forces)
  end

end
