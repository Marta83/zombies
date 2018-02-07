class ZombieArmorsController < ApplicationController

  def update
    zombie_armor = EquipUseCase.call(zombie_armor_params, repo)

    json_response(zombie_armor, :created)
  end

  def zombie_armor_params
    params.permit(:zombie_id, :armor_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_armor)
  end
end
