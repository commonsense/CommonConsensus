class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :games
  end
end
