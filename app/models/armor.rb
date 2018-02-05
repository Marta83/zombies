class Armor < ApplicationRecord
  validates_presence_of :name, :price, :defense_points, :durability
end
