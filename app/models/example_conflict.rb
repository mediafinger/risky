class ExampleConflict
  def self.run
    colombia = Country.where(name: :Colombia).first
    colombia.army.update_attributes!(size: 25)
    mexico = Country.where(name: :Mexico).first
    mexico.army.update_attributes!(size: 18)

    conflict = Conflict.new(colombia, mexico)
    victory = false

    while !victory && colombia.army.size > 1
      victory = conflict.attack(colombia.army.size - 1)
    end

    victory
  end
end
