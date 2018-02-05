class ChangeZombieFieldsToNotNull < ActiveRecord::Migration[5.1]
  def change
     change_column :zombies, :name, :string, :null => false
     change_column :zombies, :hit_points, :integer, :null => false, :default => 0
     change_column :zombies, :brains_eaten, :integer, :null => false, :default => 0
     change_column :zombies, :speed, :integer, :null => false, :default => 0
     change_column :zombies, :turn_date, :datetime, :null => false
  end
end
