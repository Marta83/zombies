class ZombiesController < ApplicationController

  def create
    callback = lambda do |zombie|
      json_response(zombie, :created)
    end

    ZombieCreateUseCase.call(zombie_params, callback, repo)
  end

  def zombie_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

  def repo
    @repo ||= ZombieRepository.new
  end
end
