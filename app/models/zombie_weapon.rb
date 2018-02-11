class ZombieWeapon < ApplicationRecord
  belongs_to :zombie
  belongs_to :weapon

  after_save { zombie.touch }
end
