class ZombieArmorsController < ApplicationController

  def update
    @zombie_armor = ZombieArmor.create!(zombie_armor_params)
    json_response(@zombie_armor, :created)
  end

  def zombie_armor_params
    params.permit(:zombie_id, :armor_id)
  end
end
