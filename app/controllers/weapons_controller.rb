class WeaponsController < ApplicationController

  def create
    success = lambda do |weapon|
      json_response(weapon, :created)
    end

    error = lambda do |errors|
      json_response(errors, 422)
    end

    CreateUseCase.call(weapon_params, repo, {success: success, failure: error})
  end

  def weapon_params
    params.permit(:name, :price, :attack_points, :durability)
  end

  def repo
    @repo ||= Repository.for(:weapon)
  end
end
