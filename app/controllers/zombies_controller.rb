class ZombiesController < ApplicationController

  def create
    callback = lambda do |zombie|
      json_response(zombie, :created)
    end

    CreateUseCase.call(zombie_params, callback, repo)
  end

  def zombie_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  def repo
    @repo ||= Repository.for(:zombie)
  end
end
