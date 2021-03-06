class Map

  def initialize(game)
    @game = game
    @grid ||= create_grid
  end

  def grid
    @grid
  end

private

  def create_grid
    grid = Array.new(8)

    for x in 0..grid.length-1
      grid[x] = Array.new(13)
    end

    return place_countries(grid)
  end

  def place_countries(grid)
    grid[1][2] = Country.part_of(@game).where(name: :Northwest_Territories).first
    grid[1][4] = Country.part_of(@game).where(name: :Greenland).first
    grid[1][6] = Country.part_of(@game).where(name: :Iceland).first
    grid[2][1] = Country.part_of(@game).where(name: :Alaska).first
    grid[2][2] = Country.part_of(@game).where(name: :British_Columbia).first
    grid[2][3] = Country.part_of(@game).where(name: :Ontario).first
    grid[2][4] = Country.part_of(@game).where(name: :Quebec).first
    grid[2][6] = Country.part_of(@game).where(name: :Great_Britain).first
    grid[2][7] = Country.part_of(@game).where(name: :Scandinavia).first
    grid[2][12] = Country.part_of(@game).where(name: :Jakutien).first
    grid[3][2] = Country.part_of(@game).where(name: :California).first
    grid[3][3] = Country.part_of(@game).where(name: :New_England).first
    grid[3][6] = Country.part_of(@game).where(name: :Spain).first
    grid[3][7] = Country.part_of(@game).where(name: :Germany).first
    grid[3][8] = Country.part_of(@game).where(name: :Ukraine).first
    grid[3][9] = Country.part_of(@game).where(name: :Ural).first
    grid[3][10] = Country.part_of(@game).where(name: :Sibiria).first
    grid[3][11] = Country.part_of(@game).where(name: :Irkutsk).first
    grid[3][12] = Country.part_of(@game).where(name: :Novosibirsk).first
    grid[4][2] = Country.part_of(@game).where(name: :Mexico).first
    grid[4][7] = Country.part_of(@game).where(name: :Italy).first
    grid[4][8] = Country.part_of(@game).where(name: :Middle_East).first
    grid[4][9] = Country.part_of(@game).where(name: :Afghanistan).first
    grid[4][10] = Country.part_of(@game).where(name: :China).first
    grid[4][11] = Country.part_of(@game).where(name: :Mongolia).first
    grid[4][12] = Country.part_of(@game).where(name: :Japan).first
    grid[5][3] = Country.part_of(@game).where(name: :Colombia).first
    grid[5][4] = Country.part_of(@game).where(name: :Brazil).first
    grid[5][6] = Country.part_of(@game).where(name: :Northwest_Africa).first
    grid[5][7] = Country.part_of(@game).where(name: :Egypt).first
    grid[5][9] = Country.part_of(@game).where(name: :India).first
    grid[5][10] = Country.part_of(@game).where(name: :Thailand).first
    grid[6][3] = Country.part_of(@game).where(name: :Peru).first
    grid[6][6] = Country.part_of(@game).where(name: :Congo).first
    grid[6][7] = Country.part_of(@game).where(name: :East_Africa).first
    grid[6][8] = Country.part_of(@game).where(name: :Madagascar).first
    grid[6][11] = Country.part_of(@game).where(name: :Indonesia).first
    grid[6][12] = Country.part_of(@game).where(name: :New_Guinea).first
    grid[6][4] = Country.part_of(@game).where(name: :Argentina).first
    grid[7][7] = Country.part_of(@game).where(name: :South_Africa).first
    grid[7][11] = Country.part_of(@game).where(name: :West_Australia).first
    grid[7][12] = Country.part_of(@game).where(name: :East_Australia).first

    return grid
  end
end
