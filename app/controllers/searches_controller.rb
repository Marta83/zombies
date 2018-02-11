class SearchesController < ApplicationController

  def index

    callbacks = callbacks_response(:ok, :unprocessable_entity)

    SearchUseCase.call(search_params, repo, callbacks)
  end


  private

  def search_params
    params.permit(:zombie_name, :armor_id, :weapon_id, :turn_date_greater, :turn_date_lesser)
  end

  def repo
    @repo ||= Repository.for(:zombie)
  end

end
