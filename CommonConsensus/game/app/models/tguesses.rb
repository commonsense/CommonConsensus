class Tguesses < ActiveRecord::Migration
  def self.up
    create_table :temp_guesses do |t|
      t.column :id,     :int
      t.column :g_string,    :string
      t.column :g_type,   :int
      t.column :g_verb, :string
      t.column :g_noun, :string
      t.column :g_both, :string
      t.column :num, :int
      t.column :goal_id, :int
      t.column :game_type, :int
    end    

  #  SystemSetting.create :name => "notice", :label => "Use notice?", :value => 1
  end

  def self.down
    list = TempGuesses.find(:all)
    for l in list
         ff = Guess.find_by_g_string(l.g_string)
         if ff 
           ff.num += 1
         else
           Guess.create(:g_string => l.g_string, :game_type => l.game_type, :g_type => l.g_type, :num => l.num, :g_verb => l.g_verb, :g_noun => l.g_noun, :g_both => l.g_both, :goal_id => l.goal_id)
         end
    
    end
    drop_table :temp_guesses
  end
end
