class ZombieArmorArRepository
  def all
    ZombieArmor.all
  end

  def find(id)
    ZombieArmor.find(id)
  end

  def new_entity(attrs = nil)
    ZombieArmor.create!(attrs)
  end

  def save(zombie_armor)
    zombie_armor.save
  end

  def delete(zombie_armor)
    zombie_armor.destroy
  end
end
