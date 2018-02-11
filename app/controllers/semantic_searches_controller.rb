class SemanticSearchesController < ApplicationController

  def index

    query = search_params['q']
    zombies = Zombie.search(query)

    json_response(zombies, :ok)
  end


  private

  def search_params
    params.required(:q)
  end

  rescue_from ActionController::ParameterMissing do
      json_error_response('Parameter not found', :not_found)
  end

end
