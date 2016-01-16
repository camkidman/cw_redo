require "application_responder"
class ::Api::V1::ApiController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :json
  include ActionController::Serialization
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }


  before_action :set_headers

private

  def set_headers
    binding.pry
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
