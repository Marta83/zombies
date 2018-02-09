class ZombieWeaponArRepository
  def all
    ZombieWeapon.all
  end

  def find(id)
    ZombieWeapon.find(id)
  end

  def new_entity(attrs = nil)
    ZombieWeapon.create!(attrs)
  end

  def save(zombie_weapon)
    zombie_weapon.save
  end

  def delete(zombie_weapon)
    zombie_weapon.destroy
  end
end
