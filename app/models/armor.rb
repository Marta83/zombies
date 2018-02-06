class Armor < ApplicationRecord
  validates_presence_of :name, :price, :defense_points, :durability

  has_one :zombie_armor
end
