class ArmorsController < ApplicationController

  def create
    callback = lambda do |armor|
      json_response(armor, :created)
    end

    CreateUseCase.call(armor_params, callback, repo)
  end

  def armor_params
    params.permit(:name, :price, :defense_points, :durability)
  end

  def repo
    @repo ||= ArmorRepository.new
  end
end
