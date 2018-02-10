class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:update, :destroy]

  def create
    success = lambda do |zombie|
      json_response(zombie, :created)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    CreateUseCase.call(zombie_params, repo, {success: success, failure: error})
  end

  def update
    success = lambda do |zombie|
      json_response(zombie, :ok)
    end

    error = lambda do |error|
      json_response(error, :unprocessable_entity)
    end

    UpdateUseCase.call(@zombie, zombie_params_update, repo, {success: success, failure: error})
  end

  def zombie_params_update
    params.permit(:id, :name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  def zombie_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  private

  def repo
    @repo ||= Repository.for(:zombie)
  end

  def set_zombie
    @zombie = repo.find(params[:id])
  end

  rescue_from Repository::ZombieNotFound do
      json_response("Zombie not found", :not_found)
  end
end
