require "application_responder"
class ::Api::V1::ApiController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :json
  include ActionController::Serialization
end
