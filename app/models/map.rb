class Map

  def self.grid
    @grid ||= create_grid
  end

  def self.create_grid
    grid = Array.new(8)

    for x in 0..grid.length-1
      grid[x] = Array.new(13)
    end

    return place_countries(grid)
  end

  def self.place_countries(grid)
    grid[1][2] = Country.where(name: :Northwest_Territories).first
    grid[1][4] = Country.where(name: :Greenland).first
    grid[1][6] = Country.where(name: :Iceland).first
    grid[2][1] = Country.where(name: :Alaska).first
    grid[2][2] = Country.where(name: :British_Columbia).first
    grid[2][3] = Country.where(name: :Ontario).first
    grid[2][4] = Country.where(name: :Quebec).first
    grid[2][6] = Country.where(name: :Great_Britain).first
    grid[2][7] = Country.where(name: :Scandinavia).first
    grid[2][12] = Country.where(name: :Jakutien).first
    grid[3][2] = Country.where(name: :California).first
    grid[3][3] = Country.where(name: :New_England).first
    grid[3][6] = Country.where(name: :Spain).first
    grid[3][7] = Country.where(name: :Germany).first
    grid[3][8] = Country.where(name: :Ukraine).first
    grid[3][9] = Country.where(name: :Ural).first
    grid[3][10] = Country.where(name: :Sibiria).first
    grid[3][11] = Country.where(name: :Irkutsk).first
    grid[3][12] = Country.where(name: :Novosibirsk).first
    grid[4][2] = Country.where(name: :Mexico).first
    grid[4][7] = Country.where(name: :Italy).first
    grid[4][8] = Country.where(name: :Middle_East).first
    grid[4][9] = Country.where(name: :Afghanistan).first
    grid[4][10] = Country.where(name: :China).first
    grid[4][11] = Country.where(name: :Mongolia).first
    grid[4][12] = Country.where(name: :Japan).first
    grid[5][3] = Country.where(name: :Colombia).first
    grid[5][4] = Country.where(name: :Brazil).first
    grid[5][6] = Country.where(name: :Northwest_Africa).first
    grid[5][7] = Country.where(name: :Egypt).first
    grid[5][9] = Country.where(name: :India).first
    grid[5][10] = Country.where(name: :Thailand).first
    grid[6][3] = Country.where(name: :Peru).first
    grid[6][6] = Country.where(name: :Congo).first
    grid[6][7] = Country.where(name: :East_Africa).first
    grid[6][8] = Country.where(name: :Madagascar).first
    grid[6][11] = Country.where(name: :Indonesia).first
    grid[6][12] = Country.where(name: :New_Guinea).first
    grid[6][4] = Country.where(name: :Argentina).first
    grid[7][7] = Country.where(name: :South_Africa).first
    grid[7][11] = Country.where(name: :West_Australia).first
    grid[7][12] = Country.where(name: :East_Australia).first

    return grid
  end
end
