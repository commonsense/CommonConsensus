class Tusers < ActiveRecord::Migration
  def self.up
    create_table :temp_users do |t|
      t.column :id,     :int
      t.column :player_id,    :int
    end

  #  SystemSetting.create :name => "notice", :label => "Use notice?", :value => 1
  end

  def self.down
    drop_table :temp_users
  end
end