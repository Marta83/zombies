class ZombieArmorArRepository < ArRepository

  def all
    ZombieArmor.all
  end

  def find(id)
    ZombieArmor.find(id)

    rescue ActiveRecord::RecordNotFound => error
          raise Repository::ZombieArmorNotFound, error.message

  end

  def new_entity(attrs = nil)
    ZombieArmor.new(attrs)
  end

  def save(zombie_armor)
    zombie_armor.save
  end

  def delete(zombie_armor)
    zombie_armor.destroy
  end
end
