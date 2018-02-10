class ArmorsController < ApplicationController
  before_action :set_armor, only: [:update, :destroy]

  def create
    success = lambda do |armor|
      json_response(armor, :created)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    CreateUseCase.call(armor_params, repo, {success: success, failure: error} )
  end

  def update
    success = lambda do |armor|
      json_response(armor, :ok)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    UpdateUseCase.call(@armor, armor_params_update, repo, {success: success, failure: error})
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
