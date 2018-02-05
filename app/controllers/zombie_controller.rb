class ZombieController < ApplicationController

  def create
    @zombie = Zombie.create!(todo_params)
    json_response(@zombie, :created)
  end

  def todo_params
    params.permit(:name, :turn_date, :hit_points, :brains_eaten, :turn_date)
  end

end
