module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_error_response(error, status = :ok)
    render json: {error: error}, status: status
  end

  def json_message_response(message, status = :ok)
    render json: {message: message}, status: status
  end

  def callbacks_response(status_ok, status_error)
    success = lambda do |entity|
      json_response(entity, status_ok)
    end

    error = lambda do |error|
      json_error_response(error, status_error)
    end

    return {success: success, failure: error}
  end



  def callbacks_message_response(message, status_ok, status_error)
    success = lambda do
      json_message_response(message, status_ok)
    end

    error = lambda do |error|
      json_error_response(error, status_error)
    end

    return {success: success, failure: error}
  end

end
