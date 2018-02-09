class ZombiesController < ApplicationController

  def create
    success = lambda do |zombie|
      json_response(zombie, :created)
    end

    error = lambda do |zombie|
      json_response(zombie, 422)
    end

    CreateUseCase.call(zombie_params, repo, {success: success, failure: error})
  end

  def zombie_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  def repo
    @repo ||= Repository.for(:zombie)
  end
end
