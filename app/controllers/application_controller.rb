class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response



private 

def render_not_found_response(error)
  render json: {error: "#{error.model} not found"}, status: :not_found
end

def render_unprocessable_entity_response(invalid)
  render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end 
#we need to hook full messages at the end for it to show as an array in one line. Without full messages it will show as a regular json
end
