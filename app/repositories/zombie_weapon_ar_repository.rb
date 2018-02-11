class ZombieWeaponArRepository < ArRepository

  def all
    ZombieWeapon.all
  end

  def find(zombie_id, weapon_id)
    ZombieWeapon.find_by!({zombie_id: zombie_id, weapon_id: weapon_id} )

  rescue ActiveRecord::RecordNotFound => error
    raise Repository::ZombieWeaponNotFound, error.message
  end

  def new_entity(attrs = nil)
    ZombieWeapon.new(attrs)
  end

  def save(zombie_weapon)
    zombie_weapon.save
  end

  def delete(zombie_weapon)
    zombie_weapon.destroy
  end
end
