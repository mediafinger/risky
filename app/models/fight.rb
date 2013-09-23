class NoBorderException < StandardError
end

class CanNotAttackYourselfException < StandardError
end

class NotEnoughTroopsException < StandardError
end

class Fight
  def initialize(attacker, defender)
    raise NoBorderException unless attacker.neighbours.include? defender.name
    raise CanNotAttackYourselfException unless attacker.player_id != defender.player_id

    @attacker = attacker
    @defender = defender
  end

  def fight(troops)
    raise NotEnoughTroopsException unless @attacker.army.size > troops

    dices_attacker = dices(troops)
    dices_defender = dices([@defender.army.size, 2].min)

    losses = calculate_losses(dices_attacker, dices_defender)

    reduce_army(@attacker.army, losses[:attacker])
    reduce_army(@defender.army, losses[:defender])

    if @defender.army
      false
    else
      take_country(troops)
      true
    end
  end

  def dices(count)
    dices = []

    for x in 0..count-1 do
      dices << rand(1..6)
    end

    dices.sort
  end

  def calculate_losses(dices_attacker, dices_defender)
    losses_attacker = [dices_defender.length - dices_attacker.length, 0].max
    losses_defender = [dices_attacker.length - dices_defender.length, 0].max

    attack_rounds = [dices_attacker.length, dices_defender.length].min

    for x in 0..(attack_rounds - 1) do
      if dices_attacker[x] > dices_defender[x]
        losses_defender += 1
      else
        losses_attacker += 1
      end
    end

    {attacker: losses_attacker, defender: losses_defender}
  end

  def reduce_army(army, count)
    if army.size - count <= 0
      puts "DESTROYED"
      army.destroy
    else
      puts "reduced"
      army.update_attributes(size: army.size - count)
    end

    army
  end

  def take_country(troops)
    occupying_forces = [troops, @attacker.army.size - 1].min

    @defender.update_attributes!(player_id: @attacker.player_id)
    Army.create!(player: @attacker.player, country_id: @defender.id, size: occupying_forces)
    @attacker.army.update_attributes!(size: @attacker.army.size - occupying_forces)

    @defender
  end

end
