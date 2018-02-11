class SearchesController < ApplicationController

  def index
    @zombies = Zombie.where(nil)

    filtering_params(search_params).each do |key, value|
      @zombies = @zombies.public_send(key, value) if value.present?
    end

    json_response(@zombies, :ok)
  end


  private

  def filtering_params(params)
      params.slice(:zombie_name, :armor_id, :weapon_id, :turn_date_greater, :turn_date_lesser)
  end

  def search_params
    params.permit(:zombie_name, :armor_id, :weapon_id, :turn_date_greater, :turn_date_lesser)
  end

end
