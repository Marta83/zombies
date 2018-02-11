class Armor < ApplicationRecord
  validates_presence_of :name, :price, :defense_points, :durability
  validates_numericality_of :defense_points, :durability, :price

  has_one :zombie_armor
  has_one :zombie, through: :zombie_armor

  after_save { unless zombie.nil?
                 zombie.touch
               end }
end
