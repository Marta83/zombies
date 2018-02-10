Rails.application.routes.draw do

  resources :zombies do
    resources :armors, param: :armor_id, controller: 'zombie_armors', only: [:update, :destroy]
    resources :weapons, param: :weapon_id, controller: 'zombie_weapons', only: [:update, :destroy]

  end

  resources :armors, only: [:create, :update,  :destroy]
  resources :weapons, only: [:create, :update,  :destroy]
end
