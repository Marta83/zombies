class ArmorArRepository < ArRepository

  def all
    Armor.all
  end

  def find(id)
    Armor.find(id)

    rescue ActiveRecord::RecordNotFound => error
      raise Repository::ArmorNotFound, error.message
  end

  def new_entity(attrs = nil)
    Armor.new(attrs)
  end

  def save(armor)
    armor.save
  end

  def delete(armor)
    armor.destroy
  end
end
