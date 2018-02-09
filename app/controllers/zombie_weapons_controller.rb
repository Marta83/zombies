class ZombieWeaponsController < ApplicationController

  def update
    success = lambda do |zombie_weapon|
      json_response(zombie_weapon, :created)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    EquipUseCase.call(zombie_weapon_params, repo, {success: success, failure: error})

  end

  def zombie_weapon_params
    params.permit(:zombie_id, :weapon_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_weapon)
  end
end
