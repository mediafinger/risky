if Rails.env == "development"
  puts "Cleaning DB first ..."
  Army.destroy_all
  Card.destroy_all
  Country.destroy_all
  Game.destroy_all
  #Neighbour.destroy_all
  Player.destroy_all
  Region.destroy_all
  Round.destroy_all
end

puts "Creating Map"
puts "  Creating Regions ..."
# Region.create!(player_id: nil, bonus: 3, name: :Afrika)
# Region.create!(player_id: nil, bonus: 7, name: :Asia)
# Region.create!(player_id: nil, bonus: 2, name: :Australia)
# Region.create!(player_id: nil, bonus: 5, name: :Europe)
Region.create!(player_id: nil, bonus: 5, name: :North_America)
Region.create!(player_id: nil, bonus: 2, name: :South_America)

puts "  Creating Countries ..."
brasil =    Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Brasil)
colombia =  Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Colombia)
mexico =    Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Mexico)
peru =      Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Peru)


puts "  Setting Neighbours ..."
Neighbour.create!(country_id: brasil.id, neighbour_id: colombia.id)
Neighbour.create!(country_id: brasil.id, neighbour_id: peru.id)
Neighbour.create!(country_id: colombia.id, neighbour_id: brasil.id)
Neighbour.create!(country_id: colombia.id, neighbour_id: mexico.id)
Neighbour.create!(country_id: colombia.id, neighbour_id: peru.id)
Neighbour.create!(country_id: mexico.id, neighbour_id: colombia.id)
Neighbour.create!(country_id: peru.id, neighbour_id: brasil.id)
Neighbour.create!(country_id: peru.id, neighbour_id: colombia.id)

puts "Creating Game ..."
Game.create!(name: :First_Duell)

puts "  Creating Players ..."
Player.create!(game: Game.where(name: :First_Duell).first, name: "Danny", rank: 1, color: :red)
Player.create!(game: Game.where(name: :First_Duell).first, name: "Andy",  rank: 2, color: :blue)


puts "Placing Armies on Map ..."
x = 0
countries = Country.all.to_a
while x < countries.length do
  Player.all.each do |player|
    countries[x].player_id = player.id
    countries[x].save!

    Army.create!(player: player, country: countries[x], size: 1)

    x += 1
    break if x > countries.length
  end
end


# Round.create!()
# Card.create!()
