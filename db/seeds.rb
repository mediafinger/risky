if Rails.env == "development"
  puts "Cleaning DB first ..."
  Army.destroy_all
  Card.destroy_all
  Country.destroy_all
  Game.destroy_all
  Player.destroy_all
  Region.destroy_all
end

puts "Creating Map"
puts "  Creating Regions ..."
Region.create!(bonus: 3, name: :Africa)
Region.create!(bonus: 7, name: :Asia)
Region.create!(bonus: 2, name: :Australia)
Region.create!(bonus: 5, name: :Europe)
Region.create!(bonus: 5, name: :North_America)
Region.create!(bonus: 2, name: :South_America)

puts "  Creating Countries ..."
alaska      =  Country.create!(region: Region.where(name: :North_America).first, name: :Alaska)
bc          =  Country.create!(region: Region.where(name: :North_America).first, name: :British_Columbia)
california  =  Country.create!(region: Region.where(name: :North_America).first, name: :California)
greenland   =  Country.create!(region: Region.where(name: :North_America).first, name: :Greenland)
mexico      =  Country.create!(region: Region.where(name: :North_America).first, name: :Mexico)
new_england =  Country.create!(region: Region.where(name: :North_America).first, name: :New_England)
nwt         =  Country.create!(region: Region.where(name: :North_America).first, name: :Northwest_Territories)
ontario     =  Country.create!(region: Region.where(name: :North_America).first, name: :Ontario)
quebec      =  Country.create!(region: Region.where(name: :North_America).first, name: :Quebec)

argentina   =  Country.create!(region: Region.where(name: :South_America).first, name: :Argentina)
brazil      =  Country.create!(region: Region.where(name: :South_America).first, name: :Brazil)
colombia    =  Country.create!(region: Region.where(name: :South_America).first, name: :Colombia)
peru        =  Country.create!(region: Region.where(name: :South_America).first, name: :Peru)

germany     =  Country.create!(region: Region.where(name: :Europe).first, name: :Germany)
gb          =  Country.create!(region: Region.where(name: :Europe).first, name: :Great_Britain)
iceland     =  Country.create!(region: Region.where(name: :Europe).first, name: :Iceland)
italy       =  Country.create!(region: Region.where(name: :Europe).first, name: :Italy)
scandinavia =  Country.create!(region: Region.where(name: :Europe).first, name: :Scandinavia)
spain       =  Country.create!(region: Region.where(name: :Europe).first, name: :Spain)
ukraine     =  Country.create!(region: Region.where(name: :Europe).first, name: :Ukraine)

congo       =  Country.create!(region: Region.where(name: :Africa).first, name: :Congo)
east_africa =  Country.create!(region: Region.where(name: :Africa).first, name: :East_Africa)
egypt       =  Country.create!(region: Region.where(name: :Africa).first, name: :Egypt)
madagascar  =  Country.create!(region: Region.where(name: :Africa).first, name: :Madagascar)
nwa         =  Country.create!(region: Region.where(name: :Africa).first, name: :Northwest_Africa)
south_africa=  Country.create!(region: Region.where(name: :Africa).first, name: :South_Africa)

afg         =  Country.create!(region: Region.where(name: :Asia).first, name: :Afghanistan)
china       =  Country.create!(region: Region.where(name: :Asia).first, name: :China)
india       =  Country.create!(region: Region.where(name: :Asia).first, name: :India)
irkutsk     =  Country.create!(region: Region.where(name: :Asia).first, name: :Irkutsk)
jakutien    =  Country.create!(region: Region.where(name: :Asia).first, name: :Jakutien)
japan       =  Country.create!(region: Region.where(name: :Asia).first, name: :Japan)
middle_east =  Country.create!(region: Region.where(name: :Asia).first, name: :Middle_East)
mongolia    =  Country.create!(region: Region.where(name: :Asia).first, name: :Mongolia)
novo        =  Country.create!(region: Region.where(name: :Asia).first, name: :Novosibirsk)
sibiria     =  Country.create!(region: Region.where(name: :Asia).first, name: :Sibiria)
thai        =  Country.create!(region: Region.where(name: :Asia).first, name: :Thailand)
ural        =  Country.create!(region: Region.where(name: :Asia).first, name: :Ural)

east_au     =  Country.create!(region: Region.where(name: :Australia).first, name: :East_Australia)
guinea      =  Country.create!(region: Region.where(name: :Australia).first, name: :New_Guinea)
indonesia   =  Country.create!(region: Region.where(name: :Australia).first, name: :Indonesia)
west_au     =  Country.create!(region: Region.where(name: :Australia).first, name: :West_Australia)


puts "  Setting Neighbours ..."
alaska.countries        << [bc, nwt, novo]
bc.countries            << [alaska, nwt, ontario, california]
california.countries    << [bc, mexico, new_england]
greenland.countries     << [nwt, ontario, quebec, iceland]
mexico.countries        << [california, new_england, colombia]
new_england.countries   << [california, mexico, ontario, quebec]
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
spain.countries         << [spain, germany, gb, italy, nwa]
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


# only for development:

puts "Creating Players ..."
players = [
  Player.create!(name: "Danny", color: :red),
  Player.create!(name: "Andy",  color: :blue),
  Player.create!(name: "Andre", color: :yellow),
  Player.create!(name: "Jens",  color: :green)
]

puts "Creating Game ..."
game = Game.create
game.add_players(players)
game.distribute_countries

