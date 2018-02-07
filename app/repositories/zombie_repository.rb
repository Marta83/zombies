class ZombieRepository
  def all
    Zombie.all
  end

  def find(id)
    Zombie.find(id)
  end

  def new_entity(attrs = nil)
    Zombie.create!(attrs)
  end

  def save(zombie)
    zombie.save
  end

  def delete(zombie)
    zombie.destroy
  end
end
