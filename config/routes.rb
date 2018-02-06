Rails.application.routes.draw do

  resources :zombies do
    resources :armors, param: :armor_id, controller: 'zombie_armors', only: [:update, :destroy]

  end

  resources :armors, only: [:create, :destroy]
  resources :weapon
end
