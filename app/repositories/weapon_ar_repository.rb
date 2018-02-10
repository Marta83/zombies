class WeaponArRepository < ArRepository

  def all
    Weapon.all
  end

  def find(id)
    Weapon.find(id)

  rescue ActiveRecord::RecordNotFound => error
    raise Repository::WeaponNotFound, error.message
  end

  def new_entity(attrs = nil)
    Weapon.new(attrs)
  end

  def save(weapon)
    weapon.save
  end

  def delete(weapon)
    weapon.destroy
  end
end
