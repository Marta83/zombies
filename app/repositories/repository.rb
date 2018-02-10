class Repository
  ZombieNotFound  = Class.new(StandardError)
  WeaponNotFound  = Class.new(StandardError)
  ArmorNotFound  = Class.new(StandardError)
  ZombieArmorNotFound  = Class.new(StandardError)
  ZombieWeaponNotFound  = Class.new(StandardError)

  def self.register(type, repo)
    repositories[type] = repo
  end

  def self.repositories
    @repositories ||= {}
  end

  def self.for(type)
    repositories[type]
  end
end
