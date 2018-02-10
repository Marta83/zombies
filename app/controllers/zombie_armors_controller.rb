class ZombieArmorsController < ApplicationController

  def update
    callbacks = callbacks_response(:created, :unprocessable_entity)

    EquipUseCase.call(zombie_armor_params, repo, callbacks)

  end

  def zombie_armor_params
    params.permit(:zombie_id, :armor_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_armor)
  end
end
