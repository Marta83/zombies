class Zombie < ApplicationRecord
  validates_presence_of :name, :turn_date
  validates_numericality_of :hit_points, :brains_eaten, :speed

  has_many :zombie_armors
  has_many :zombie_weapons
  has_many :armors, through: :zombie_armors
  has_many :weapons, through: :zombie_weapons
end
