class Zombie < ApplicationRecord
  validates_presence_of :name, :turn_date
  has_one :armor,  class_name: 'ZombieArmor'
  has_one :weapon, class_name: 'ZombieWeapon'
end
