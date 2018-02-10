class Weapon < ApplicationRecord
  validates_presence_of :name, :price, :attack_points, :durability
  validates_numericality_of :attack_points, :durability, :price

  has_one :zombie_weapon
end
