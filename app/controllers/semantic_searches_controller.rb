class SemanticSearchesController < ApplicationController

  def index

    callbacks = callbacks_response(:ok, :unprocessable_entity)

    SemanticSearchUseCase.call(search_params, repo, callbacks)
  end


  private

  def search_params
    params.required(:q)
  end

  def repo
    @repo ||= Repository.for(:zombie)
  end


  rescue_from ActionController::ParameterMissing do
      json_error_response('Parameter not found', :not_found)
  end

end
