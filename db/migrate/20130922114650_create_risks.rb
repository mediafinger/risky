class CreateRisks < ActiveRecord::Migration
  def change

    create_table :armies do |t|
      t.integer  :country_id
      t.integer  :game_id
      t.integer  :player_id
      t.integer  :size
      t.timestamps
    end

    create_table :cards do |t|
      t.integer  :country_id
      t.integer  :game_id
      t.integer  :player_id
      t.integer  :bonus
      t.string   :name
      t.timestamps
    end

    create_table :countries do |t|
      t.integer  :game_id
      t.integer  :player_id
      t.integer  :region_id
      t.string   :name
      t.timestamps
    end

    create_table :games do |t|
      t.string   :name
      t.timestamps
    end

    create_table :countries_countries do |t|
      t.integer  :country_id
      t.integer  :neighbour_id
      t.timestamps
    end

    create_table :players do |t|
      t.integer  :game_id
      t.boolean  :active,      :default => false
      t.string   :name
      t.integer  :rank
      t.string   :color
      t.timestamps
    end

    create_table :regions do |t|
      t.integer  :game_id
      t.integer  :player_id
      t.integer  :bonus
      t.string   :name
      t.string   :color
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer  :game_id
      t.integer  :rank
      t.timestamps
    end

  end
end
