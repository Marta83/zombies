module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def callbacks_response(status_ok, status_error)
    success = lambda do |entity|
      json_response(entity, status_ok)
    end

    error = lambda do |error|
      json_response(error, status_error)
    end

    return {success: success, failure: error}
  end
end
