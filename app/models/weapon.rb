class Weapon < ApplicationRecord
  validates_presence_of :name, :price, :attack_points, :durability
end
