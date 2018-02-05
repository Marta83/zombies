class ChangeArmorsFieldsToNotNull < ActiveRecord::Migration[5.1]
  def change
     change_column :armors, :name, :string, :null => false
     change_column :armors, :defense_points, :integer, :null => false
     change_column :armors, :durability, :integer, :null => false
     change_column :armors, :price, :integer, :null => false
  end
end
