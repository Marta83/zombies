class ZombieArmor < ApplicationRecord
  belongs_to :zombie
  belongs_to :armor

  after_save { zombie.touch }
end
