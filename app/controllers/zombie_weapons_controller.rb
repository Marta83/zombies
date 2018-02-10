class ZombieWeaponsController < ApplicationController

  def update
    callbacks = callbacks_response(:created, :unprocessable_entity)

    EquipUseCase.call(zombie_weapon_params, repo, callbacks)

  end

  def zombie_weapon_params
    params.permit(:zombie_id, :weapon_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_weapon)
  end
end
