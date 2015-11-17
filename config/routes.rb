require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:create] do
        resources :personal_details, :only => [:show, :create]
        get :dashboard
      end
    end
  end
end
