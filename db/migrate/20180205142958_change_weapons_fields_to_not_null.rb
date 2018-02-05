class ChangeWeaponsFieldsToNotNull < ActiveRecord::Migration[5.1]
  def change
       change_column :weapons, :name, :string, :null => false
       change_column :weapons, :attack_points, :integer, :null => false
       change_column :weapons, :durability, :integer, :null => false
       change_column :weapons, :price, :integer, :null => false
  end
end
