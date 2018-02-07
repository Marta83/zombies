class WeaponsController < ApplicationController

  def create
    callback = lambda do |weapon|
      json_response(weapon, :created)
    end

    CreateUseCase.call(weapon_params, callback, repo)
  end

  def weapon_params
    params.permit(:name, :price, :attack_points, :durability)
  end

  def repo
    @repo ||= WeaponRepository.new
  end
end
