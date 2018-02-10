class ZombieArRepository < ArRepository

  def all
    Zombie.all
  end

  def find(id)
    Zombie.find(id)

    rescue ActiveRecord::RecordNotFound => error
          raise Repository::ZombieNotFound, error.message
  end

  def new_entity(attrs = nil)
    Zombie.new(attrs)
  end

  def save(zombie)
    zombie.save
  end

  def delete(zombie)
    zombie.destroy
  end
end
