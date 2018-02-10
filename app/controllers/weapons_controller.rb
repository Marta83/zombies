class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:update, :destroy]

  def create
    success = lambda do |weapon|
      json_response(weapon, :created)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    CreateUseCase.call(weapon_params, repo, {success: success, failure: error})
  end

  def update
    success = lambda do |weapon|
      json_response(weapon, :ok)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    UpdateUseCase.call(@weapon, weapon_params_update, repo, {success: success, failure: error})
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
      json_response("Weapon not found", :not_found)
  end
end
