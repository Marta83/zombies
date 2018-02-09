class ArmorsController < ApplicationController

  def create
    success = lambda do |armor|
      json_response(armor, :created)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    CreateUseCase.call(armor_params, repo, {success: success, failure: error} )
  end

  def armor_params
    params.permit(:name, :price, :defense_points, :durability)
  end

  def repo
    @repo ||= Repository.for(:armor)
  end
end
