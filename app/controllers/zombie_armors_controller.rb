class ZombieArmorsController < ApplicationController
  before_action :set_zombie_armor, only: [:destroy]

  def update
    callbacks = callbacks_response(:created, :unprocessable_entity)
    EquipUseCase.call(zombie_armor_params, repo, callbacks)

  end


  def destroy

    callbacks = callbacks_message_response("Zombie Armor unequiped",:ok, :unprocessable_entity)

    DestroyUseCase.call(@zombie_armor, zombie_armor_params_delete, repo, callbacks)
  end

  private

  def zombie_armor_params
    params.permit(:zombie_id, :armor_id)
  end

  def set_zombie_armor
    @zombie_armor = repo.find(params[:zombie_id], params[:armor_id])
  end

  def zombie_armor_params_delete
    params.permit(:zombie_id, :armor_id)
  end

  def repo
    @repo ||= Repository.for(:zombie_armor)
  end

  rescue_from Repository::ZombieArmorNotFound do
      json_error_response("Zombie armor not found", :not_found)
  end
end
