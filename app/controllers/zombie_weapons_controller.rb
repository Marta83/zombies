class ZombieWeaponsController < ApplicationController

  def update
    zombie_weapon = EquipUseCase.call(zombie_weapon_params, repo)

    json_response(zombie_weapon, :created)
  end

  def zombie_weapon_params
    params.permit(:zombie_id, :weapon_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_weapon)
  end
end
