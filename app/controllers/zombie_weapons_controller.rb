class ZombieWeaponsController < ApplicationController
  before_action :set_zombie_weapon, only: [:destroy]

  def update
    callbacks = callbacks_response(:created, :unprocessable_entity)

    EquipUseCase.call(zombie_weapon_params, repo, callbacks)

  end
  def destroy

    callbacks = callbacks_message_response("Zombie Weapon unequiped",:ok, :unprocessable_entity)

    DestroyUseCase.call(@zombie_weapon, zombie_weapon_params_delete, repo, callbacks)
  end

  private

  def set_zombie_weapon
    @zombie_weapon = repo.find(params[:zombie_id], params[:weapon_id])
  end

  def zombie_weapon_params_delete
    params.permit(:zombie_id, :weapon_id)
  end

  def zombie_weapon_params
    params.permit(:zombie_id, :weapon_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_weapon)
  end

  rescue_from Repository::ZombieWeaponNotFound do
      json_error_response("Zombie weapon not found", :not_found)
  end
end
