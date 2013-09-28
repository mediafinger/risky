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
alaska.countries        << [bc, nwt, novo]
bc.countries            << [alaska, nwt, ontario, california]
california.countries    << [bc, mexico, new_england]
greenland.countries     << [nwt, ontario, quebec, iceland]
mexico.countries        << [california, new_england, colombia]
nwt.countries           << [alaska, bc, ontario, greenland]
ontario.countries       << [nwt, bc, new_england, quebec, greenland]
quebec.countries        << [ontario, greenland, new_england]

brazil.countries        << [colombia, peru, argentina, nwa]
colombia.countries      << [mexico, brazil, peru]
peru.countries          << [brazil, colombia, argentina]
argentina.countries     << [brazil, peru]

germany.countries       << [gb, scandinavia, ukraine, italy, spain]
gb.countries            << [germany, scandinavia, iceland, spain]
iceland.countries       << [greenland, scandinavia, gb]
italy.countries         << [spain, germany, ukraine, middle_east, egypt, nwa]
scandinavia.countries   << [iceland, ukraine, germany, gb]
spain.countries         << [spain, germany, italy, nwa]
ukraine.countries       << [scandinavia, germany, italy, middle_east, afg, ural]

congo.countries         << [nwa, east_africa, south_africa]
east_africa.countries   << [middle_east, madagascar, south_africa, congo, nwa, egypt]
egypt.countries         << [italy, middle_east, east_africa, nwa]
madagascar.countries    << [east_africa, south_africa]
nwa.countries           << [spain, italy, egypt, east_africa, congo, brazil]
south_africa.countries  << [madagascar, congo, east_africa]

afg.countries           << [china, india, middle_east, ural, ukraine]
china.countries         << [afg, india, mongolia, sibiria, thai, ural]
india.countries         << [afg, china, middle_east, thai]
irkutsk.countries       << [jakutien, mongolia, novo, sibiria]
jakutien.countries      << [irkutsk, novo, sibiria]
japan.countries         << [mongolia, novo]
middle_east.countries   << [afg, india, east_africa, egypt, italy, ukraine]
mongolia.countries      << [china, irkutsk, japan, novo, sibiria]
novo.countries          << [irkutsk, jakutien, japan, mongolia]
sibiria.countries       << [china, irkutsk, jakutien, mongolia, ural]
thai.countries          << [china, india, indonesia]
ural.countries          << [afg, china, sibiria, ukraine]

indonesia.countries     << [thai, guinea, west_au]
guinea.countries        << [west_au, east_au, indonesia]
east_au.countries       << [guinea, west_au]
west_au.countries       << [guinea, east_au, indonesia]


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
