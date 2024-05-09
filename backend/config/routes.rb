# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  post 'login', to: 'team_administrators#login'

  resources :cars do
    get :tires
  end
end
