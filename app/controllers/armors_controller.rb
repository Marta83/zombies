class ArmorsController < ApplicationController
  before_action :set_armor, only: [:update, :destroy]

  def create
    callbacks = callbacks_response(:created, :unprocessable_entity)

    CreateUseCase.call(armor_params, repo, callbacks )
  end

  def update
    callbacks = callbacks_response(:ok, :unprocessable_entity)

    UpdateUseCase.call(@armor, armor_params_update, repo, callbacks)
  end

  private

  def armor_params_update
    params.permit(:id, :name, :price, :defense_points, :durability)
  end

  def armor_params
    params.permit(:name, :price, :defense_points, :durability)
  end

  def repo
    @repo ||= Repository.for(:armor)
  end

  def set_armor
    @armor = repo.find(params[:id])
  end

  rescue_from Repository::ArmorNotFound do
      json_response("Armor not found", :not_found)
  end
end
