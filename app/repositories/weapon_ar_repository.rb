class WeaponArRepository
  def all
    Weapon.all
  end

  def find(id)
    Weapon.find(id)
  end

  def new_entity(attrs = nil)
    Weapon.create!(attrs)
  end

  def save(weapon)
    weapon.save
  end

  def delete(weapon)
    weapon.destroy
  end
end
