class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:update, :destroy]

  def create
    callbacks = callbacks_response(:created, :unprocessable_entity)

    CreateUseCase.call(weapon_params, repo, callbacks)
  end

  def update
    callbacks = callbacks_response(:ok, :unprocessable_entity)

    UpdateUseCase.call(@weapon, weapon_params_update, repo, callbacks)
  end

  private

  def weapon_params_update
    params.permit(:id, :name, :price, :attack_points, :durability)
  end

  def weapon_params
    params.permit(:name, :price, :attack_points, :durability)
  end

  def repo
    @repo ||= Repository.for(:weapon)
  end

  def set_weapon
    @weapon = repo.find(params[:id])
  end

  rescue_from Repository::WeaponNotFound do
      json_error_response("Weapon not found", :not_found)
  end
end
