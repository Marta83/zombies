class ZombieArmorsController < ApplicationController

  def update
    success = lambda do |zombie_armor|
      json_response(zombie_armor, :created)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    EquipUseCase.call(zombie_armor_params, repo, {success: success, failure: error})

  end

  def zombie_armor_params
    params.permit(:zombie_id, :armor_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_armor)
  end
end
