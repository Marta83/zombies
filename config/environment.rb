# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Repository.register(:zombie, ZombieArRepository.new)
Repository.register(:armor, ArmorArRepository.new)
Repository.register(:weapon, WeaponArRepository.new)
Repository.register(:zombie_armor, ZombieArmorArRepository.new)
Repository.register(:zombie_weapon, ZombieWeaponArRepository.new)
