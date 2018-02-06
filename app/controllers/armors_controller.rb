class ArmorsController < ApplicationController

  def create
    @armor = Armor.create!(todo_params)
    json_response(@armor, :created)
  end

  def todo_params
    params.permit(:name, :price, :defense_points, :durability)
  end

end
