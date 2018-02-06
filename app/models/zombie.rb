class Zombie < ApplicationRecord
  validates_presence_of :name, :turn_date
  has_many :armors,  class_name: 'ZombieArmor'
  has_many :weapons, class_name: 'ZombieWeapon'
end
