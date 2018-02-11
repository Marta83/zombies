class Weapon < ApplicationRecord
  validates_presence_of :name, :price, :attack_points, :durability
  validates_numericality_of :attack_points, :durability, :price

  has_one :zombie_weapon
  has_one :zombie, through: :zombie_weapon

  after_save { unless zombie.nil?
                 zombie.touch
               end }
end
