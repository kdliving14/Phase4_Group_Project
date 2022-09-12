class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable
    
  private

  def not_found(e)
    render json: {error: "#{e.model} not found"}, status: :not_found
  end

  def unprocessable(e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
  end

end
