class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:update, :destroy]

  def create
    callbacks = callbacks_response(:created, :unprocessable_entity)

    CreateUseCase.call(zombie_params, repo, callbacks)
  end

  def update
    callbacks = callbacks_response(:ok, :unprocessable_entity)

    UpdateUseCase.call(@zombie, zombie_params_update, repo, callbacks)
  end

  def destroy

    success = lambda do
      json_error_response("Zombie Deleted", :ok)
    end
    error = lambda do |error|
      json_error_response(error, :unprocessable_entity)
    end

    callbacks = {success: success, failure: error}


    DestroyUseCase.call(@zombie, zombie_params_delete, repo, callbacks)
  end

  private

  def zombie_params_delete
    params.require(:id)
  end

  def zombie_params_update
    params.permit(:id, :name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  def zombie_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  def repo
    @repo ||= Repository.for(:zombie)
  end

  def set_zombie
    @zombie = repo.find(params[:id])
  end

  rescue_from Repository::ZombieNotFound do
      json_error_response("Zombie not found", :not_found)
  end
end
