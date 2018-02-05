class WeaponController < ApplicationController

  def create
    @weapon = Weapon.create!(todo_params)
    json_response(@weapon, :created)
  end

  def todo_params
    params.permit(:name, :price, :attack_points, :durability)
  end

end
