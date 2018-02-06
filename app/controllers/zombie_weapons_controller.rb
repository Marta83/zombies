class ZombieWeaponsController < ApplicationController

  def update
    @zombie_weapon = ZombieWeapon.create!(zombie_weapon_params)
    json_response(@zombie_weapon, :created)
  end

  def zombie_weapon_params
    params.permit(:zombie_id, :weapon_id)
  end
end
