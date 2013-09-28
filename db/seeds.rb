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
Region.create!(player_id: nil, bonus: 3, name: :Africa)
Region.create!(player_id: nil, bonus: 7, name: :Asia)
Region.create!(player_id: nil, bonus: 2, name: :Australia)
Region.create!(player_id: nil, bonus: 5, name: :Europe)
Region.create!(player_id: nil, bonus: 5, name: :North_America)
Region.create!(player_id: nil, bonus: 2, name: :South_America)

puts "  Creating Countries ..."
alaska      =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Alaska)
bc          =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :British_Columbia)
california  =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :California)
greenland   =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Greenland)
mexico      =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Mexico)
new_england =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :New_England)
nwt         =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Northwest_Territories)
ontario     =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Ontario)
quebec      =  Country.create!(player_id: nil, region: Region.where(name: :North_America).first, name: :Quebec)

argentina   =  Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Argentina)
brazil      =  Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Brazil)
colombia    =  Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Colombia)
peru        =  Country.create!(player_id: nil, region: Region.where(name: :South_America).first, name: :Peru)

germany     =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Germany)
gb          =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Great_Britain)
iceland     =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Iceland)
italy       =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Italy)
scandinavia =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Scandinavia)
spain       =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Spain)
ukraine     =  Country.create!(player_id: nil, region: Region.where(name: :Europe).first, name: :Ukraine)

congo       =  Country.create!(player_id: nil, region: Region.where(name: :Africa).first, name: :Congo)
east_africa =  Country.create!(player_id: nil, region: Region.where(name: :Africa).first, name: :East_Africa)
egypt       =  Country.create!(player_id: nil, region: Region.where(name: :Africa).first, name: :Egypt)
madagascar  =  Country.create!(player_id: nil, region: Region.where(name: :Africa).first, name: :Madagascar)
nwa         =  Country.create!(player_id: nil, region: Region.where(name: :Africa).first, name: :Northwest_Africa)
south_africa=  Country.create!(player_id: nil, region: Region.where(name: :Africa).first, name: :South_Africa)

afg         =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Afghanistan)
china       =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :China)
india       =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :India)
irkutsk     =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Irkutsk)
jakutien    =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Jakutien)
japan       =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Japan)
middle_east =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Middle_East)
mongolia    =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Mongolia)
novo        =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Novosibirsk)
sibiria     =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Sibiria)
thai        =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Thailand)
ural        =  Country.create!(player_id: nil, region: Region.where(name: :Asia).first, name: :Ural)

east_au     =  Country.create!(player_id: nil, region: Region.where(name: :Australia).first, name: :East_Australia)
guinea      =  Country.create!(player_id: nil, region: Region.where(name: :Australia).first, name: :New_Guinea)
indonesia   =  Country.create!(player_id: nil, region: Region.where(name: :Australia).first, name: :Indonesia)
west_au     =  Country.create!(player_id: nil, region: Region.where(name: :Australia).first, name: :West_Australia)


puts "  Setting Neighbours ..."
Neighbour.create!(country_id: alaska.id, neighbour_id: bc.id)
Neighbour.create!(country_id: alaska.id, neighbour_id: nwt.id)
Neighbour.create!(country_id: alaska.id, neighbour_id: novo.id)

Neighbour.create!(country_id: bc.id, neighbour_id: alaska.id)
Neighbour.create!(country_id: bc.id, neighbour_id: nwt.id)
Neighbour.create!(country_id: bc.id, neighbour_id: ontario.id)
Neighbour.create!(country_id: bc.id, neighbour_id: california.id)

Neighbour.create!(country_id: california.id, neighbour_id: bc.id)
Neighbour.create!(country_id: california.id, neighbour_id: mexico.id)
Neighbour.create!(country_id: california.id, neighbour_id: new_england.id)

Neighbour.create!(country_id: greenland.id, neighbour_id: nwt.id)
Neighbour.create!(country_id: greenland.id, neighbour_id: ontario.id)
Neighbour.create!(country_id: greenland.id, neighbour_id: quebec.id)
Neighbour.create!(country_id: greenland.id, neighbour_id: iceland.id)

Neighbour.create!(country_id: mexico.id, neighbour_id: california.id)
Neighbour.create!(country_id: mexico.id, neighbour_id: new_england.id)
Neighbour.create!(country_id: mexico.id, neighbour_id: colombia.id)

Neighbour.create!(country_id: nwt.id, neighbour_id: alaska.id)
Neighbour.create!(country_id: nwt.id, neighbour_id: bc.id)
Neighbour.create!(country_id: nwt.id, neighbour_id: ontario.id)
Neighbour.create!(country_id: nwt.id, neighbour_id: greenland.id)

Neighbour.create!(country_id: ontario.id, neighbour_id: nwt.id)
Neighbour.create!(country_id: ontario.id, neighbour_id: bc.id)
Neighbour.create!(country_id: ontario.id, neighbour_id: new_england.id)
Neighbour.create!(country_id: ontario.id, neighbour_id: quebec.id)
Neighbour.create!(country_id: ontario.id, neighbour_id: greenland.id)

Neighbour.create!(country_id: quebec.id, neighbour_id: ontario.id)
Neighbour.create!(country_id: quebec.id, neighbour_id: greenland.id)
Neighbour.create!(country_id: quebec.id, neighbour_id: new_england.id)

Neighbour.create!(country_id: brazil.id, neighbour_id: colombia.id)
Neighbour.create!(country_id: brazil.id, neighbour_id: peru.id)
Neighbour.create!(country_id: brazil.id, neighbour_id: argentina.id)
Neighbour.create!(country_id: brazil.id, neighbour_id: nwa.id)

Neighbour.create!(country_id: colombia.id, neighbour_id: mexico.id)
Neighbour.create!(country_id: colombia.id, neighbour_id: brazil.id)
Neighbour.create!(country_id: colombia.id, neighbour_id: peru.id)

Neighbour.create!(country_id: peru.id, neighbour_id: brazil.id)
Neighbour.create!(country_id: peru.id, neighbour_id: colombia.id)
Neighbour.create!(country_id: peru.id, neighbour_id: argentina.id)

Neighbour.create!(country_id: argentina.id, neighbour_id: brazil.id)
Neighbour.create!(country_id: argentina.id, neighbour_id: peru.id)

Neighbour.create!(country_id: germany.id, neighbour_id: gb.id)
Neighbour.create!(country_id: germany.id, neighbour_id: scandinavia.id)
Neighbour.create!(country_id: germany.id, neighbour_id: ukraine.id)
Neighbour.create!(country_id: germany.id, neighbour_id: italy.id)
Neighbour.create!(country_id: germany.id, neighbour_id: spain.id)

Neighbour.create!(country_id: gb.id, neighbour_id: germany.id)
Neighbour.create!(country_id: gb.id, neighbour_id: scandinavia.id)
Neighbour.create!(country_id: gb.id, neighbour_id: iceland.id)
Neighbour.create!(country_id: gb.id, neighbour_id: spain.id)

Neighbour.create!(country_id: iceland.id, neighbour_id: greenland.id)
Neighbour.create!(country_id: iceland.id, neighbour_id: scandinavia.id)
Neighbour.create!(country_id: iceland.id, neighbour_id: gb.id)

Neighbour.create!(country_id: italy.id, neighbour_id: spain.id)
Neighbour.create!(country_id: italy.id, neighbour_id: germany.id)
Neighbour.create!(country_id: italy.id, neighbour_id: ukraine.id)
Neighbour.create!(country_id: italy.id, neighbour_id: middle_east.id)
Neighbour.create!(country_id: italy.id, neighbour_id: egypt.id)
Neighbour.create!(country_id: italy.id, neighbour_id: nwa.id)

Neighbour.create!(country_id: scandinavia.id, neighbour_id: iceland.id)
Neighbour.create!(country_id: scandinavia.id, neighbour_id: ukraine.id)
Neighbour.create!(country_id: scandinavia.id, neighbour_id: germany.id)
Neighbour.create!(country_id: scandinavia.id, neighbour_id: gb.id)

Neighbour.create!(country_id: spain.id, neighbour_id: spain.id)
Neighbour.create!(country_id: spain.id, neighbour_id: germany.id)
Neighbour.create!(country_id: spain.id, neighbour_id: italy.id)
Neighbour.create!(country_id: spain.id, neighbour_id: nwa.id)

Neighbour.create!(country_id: ukraine.id, neighbour_id: scandinavia.id)
Neighbour.create!(country_id: ukraine.id, neighbour_id: germany.id)
Neighbour.create!(country_id: ukraine.id, neighbour_id: italy.id)
Neighbour.create!(country_id: ukraine.id, neighbour_id: middle_east.id)
Neighbour.create!(country_id: ukraine.id, neighbour_id: afg.id)
Neighbour.create!(country_id: ukraine.id, neighbour_id: ural.id)

Neighbour.create!(country_id: congo.id, neighbour_id: nwa.id)
Neighbour.create!(country_id: congo.id, neighbour_id: east_africa.id)
Neighbour.create!(country_id: congo.id, neighbour_id: south_africa.id)

Neighbour.create!(country_id: east_africa.id, neighbour_id: middle_east.id)
Neighbour.create!(country_id: east_africa.id, neighbour_id: madagascar.id)
Neighbour.create!(country_id: east_africa.id, neighbour_id: south_africa.id)
Neighbour.create!(country_id: east_africa.id, neighbour_id: congo.id)
Neighbour.create!(country_id: east_africa.id, neighbour_id: nwa.id)
Neighbour.create!(country_id: east_africa.id, neighbour_id: egypt.id)

Neighbour.create!(country_id: egypt.id, neighbour_id: italy.id)
Neighbour.create!(country_id: egypt.id, neighbour_id: middle_east.id)
Neighbour.create!(country_id: egypt.id, neighbour_id: east_africa.id)
Neighbour.create!(country_id: egypt.id, neighbour_id: nwa.id)

Neighbour.create!(country_id: madagascar.id, neighbour_id: east_africa.id)
Neighbour.create!(country_id: madagascar.id, neighbour_id: south_africa.id)

Neighbour.create!(country_id: nwa.id, neighbour_id: spain.id)
Neighbour.create!(country_id: nwa.id, neighbour_id: italy.id)
Neighbour.create!(country_id: nwa.id, neighbour_id: egypt.id)
Neighbour.create!(country_id: nwa.id, neighbour_id: east_africa.id)
Neighbour.create!(country_id: nwa.id, neighbour_id: congo.id)
Neighbour.create!(country_id: nwa.id, neighbour_id: brazil.id)

Neighbour.create!(country_id: south_africa.id, neighbour_id: madagascar.id)
Neighbour.create!(country_id: south_africa.id, neighbour_id: congo.id)
Neighbour.create!(country_id: south_africa.id, neighbour_id: east_africa.id)

Neighbour.create!(country_id: afg.id, neighbour_id: china.id)
Neighbour.create!(country_id: afg.id, neighbour_id: india.id)
Neighbour.create!(country_id: afg.id, neighbour_id: middle_east.id)
Neighbour.create!(country_id: afg.id, neighbour_id: ural.id)
Neighbour.create!(country_id: afg.id, neighbour_id: ukraine.id)

Neighbour.create!(country_id: china.id, neighbour_id: afg.id)
Neighbour.create!(country_id: china.id, neighbour_id: india.id)
Neighbour.create!(country_id: china.id, neighbour_id: mongolia.id)
Neighbour.create!(country_id: china.id, neighbour_id: sibiria.id)
Neighbour.create!(country_id: china.id, neighbour_id: thai.id)
Neighbour.create!(country_id: china.id, neighbour_id: ural.id)

Neighbour.create!(country_id: india.id, neighbour_id: afg.id)
Neighbour.create!(country_id: india.id, neighbour_id: china.id)
Neighbour.create!(country_id: india.id, neighbour_id: middle_east.id)
Neighbour.create!(country_id: india.id, neighbour_id: thai.id)

Neighbour.create!(country_id: irkutsk.id, neighbour_id: jakutien.id)
Neighbour.create!(country_id: irkutsk.id, neighbour_id: mongolia.id)
Neighbour.create!(country_id: irkutsk.id, neighbour_id: novo.id)
Neighbour.create!(country_id: irkutsk.id, neighbour_id: sibiria.id)

Neighbour.create!(country_id: jakutien.id, neighbour_id: irkutsk.id)
Neighbour.create!(country_id: jakutien.id, neighbour_id: novo.id)
Neighbour.create!(country_id: jakutien.id, neighbour_id: sibiria.id)

Neighbour.create!(country_id: japan.id, neighbour_id: mongolia.id)
Neighbour.create!(country_id: japan.id, neighbour_id: novo.id)

Neighbour.create!(country_id: middle_east.id, neighbour_id: afg.id)
Neighbour.create!(country_id: middle_east.id, neighbour_id: india.id)
Neighbour.create!(country_id: middle_east.id, neighbour_id: east_africa.id)
Neighbour.create!(country_id: middle_east.id, neighbour_id: egypt.id)
Neighbour.create!(country_id: middle_east.id, neighbour_id: italy.id)
Neighbour.create!(country_id: middle_east.id, neighbour_id: ukraine.id)

Neighbour.create!(country_id: mongolia.id, neighbour_id: china.id)
Neighbour.create!(country_id: mongolia.id, neighbour_id: irkutsk.id)
Neighbour.create!(country_id: mongolia.id, neighbour_id: japan.id)
Neighbour.create!(country_id: mongolia.id, neighbour_id: novo.id)
Neighbour.create!(country_id: mongolia.id, neighbour_id: sibiria.id)

Neighbour.create!(country_id: novo.id, neighbour_id: irkutsk.id)
Neighbour.create!(country_id: novo.id, neighbour_id: jakutien.id)
Neighbour.create!(country_id: novo.id, neighbour_id: japan.id)
Neighbour.create!(country_id: novo.id, neighbour_id: mongolia.id)

Neighbour.create!(country_id: sibiria.id, neighbour_id: china.id)
Neighbour.create!(country_id: sibiria.id, neighbour_id: irkutsk.id)
Neighbour.create!(country_id: sibiria.id, neighbour_id: jakutien.id)
Neighbour.create!(country_id: sibiria.id, neighbour_id: mongolia.id)
Neighbour.create!(country_id: sibiria.id, neighbour_id: ural.id)

Neighbour.create!(country_id: thai.id, neighbour_id: china.id)
Neighbour.create!(country_id: thai.id, neighbour_id: india.id)
Neighbour.create!(country_id: thai.id, neighbour_id: indonesia.id)

Neighbour.create!(country_id: ural.id, neighbour_id: afg.id)
Neighbour.create!(country_id: ural.id, neighbour_id: china.id)
Neighbour.create!(country_id: ural.id, neighbour_id: sibiria.id)
Neighbour.create!(country_id: ural.id, neighbour_id: ukraine.id)

Neighbour.create!(country_id: indonesia.id, neighbour_id: thai.id)
Neighbour.create!(country_id: indonesia.id, neighbour_id: guinea.id)
Neighbour.create!(country_id: indonesia.id, neighbour_id: west_au.id)

Neighbour.create!(country_id: guinea.id, neighbour_id: west_au.id)
Neighbour.create!(country_id: guinea.id, neighbour_id: east_au.id)
Neighbour.create!(country_id: guinea.id, neighbour_id: indonesia.id)

Neighbour.create!(country_id: east_au.id, neighbour_id: guinea.id)
Neighbour.create!(country_id: east_au.id, neighbour_id: west_au.id)

Neighbour.create!(country_id: west_au.id, neighbour_id: guinea.id)
Neighbour.create!(country_id: west_au.id, neighbour_id: east_au.id)
Neighbour.create!(country_id: west_au.id, neighbour_id: indonesia.id)


puts "Creating Game ..."
Game.create!(name: :First_Duell)

puts "  Creating Players ..."
Player.create!(game: Game.where(name: :First_Duell).first, name: "Danny", rank: 1, color: :red)
Player.create!(game: Game.where(name: :First_Duell).first, name: "Andy",  rank: 2, color: :blue)
Player.create!(game: Game.where(name: :First_Duell).first, name: "Andre", rank: 3, color: :yellow)
Player.create!(game: Game.where(name: :First_Duell).first, name: "Jens",  rank: 4, color: :green)


puts "Placing Armies on Map ..."
x = 0
countries = Country.all.to_a.shuffle
while x < countries.length - 1 do
  Player.all.each do |player|
    countries[x].update_attributes!(player_id: player.id)
    Army.create!(player: player, country: countries[x], size: 1)

    x += 1
    break if x >= countries.length
  end
end


# Round.create!()
# Card.create!()
