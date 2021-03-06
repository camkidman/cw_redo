require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :exercises, :only => [:create, :show]
      resources :users, :only => [:create, :update] do
        resources :personal_details, :only => [:show, :create]
        get :dashboard
        resource :initial_test, :only => [:show, :update]
        resources :exercise_details, :only => [:index, :create, :show]
        resources :workouts, :only => [:show, :index, :update]
        resources :goals, :only => [:index]
        resource :goals, :only => [:update]
        resource :schedule, :only => [:update]
      end
        mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
#constraints: { subdomain: 'api' }
