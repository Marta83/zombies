class ZombiesController < ApplicationController

  def create
    @zombie = Zombie.create!(zombie_params)
    json_response(@zombie, :created)
  end

  def zombie_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

end
