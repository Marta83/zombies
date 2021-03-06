Rails.application.routes.draw do

  resources :zombies do
    resources :armors, param: :armor_id, controller: 'zombie_armors', only: [:update, :destroy]
    resources :weapons, param: :weapon_id, controller: 'zombie_weapons', only: [:update, :destroy]

  end

  resources :armors, only: [:create, :update,  :destroy]
  resources :weapons, only: [:create, :update,  :destroy]


  get '/searches', to: 'searches#index'
  get '/semantic_searches', to: 'semantic_searches#index'
end


Repository.register(:zombie, ZombieArRepository.new)
Repository.register(:armor, ArmorArRepository.new)
Repository.register(:weapon, WeaponArRepository.new)
Repository.register(:zombie_armor, ZombieArmorArRepository.new)
Repository.register(:zombie_weapon, ZombieWeaponArRepository.new)

