Rails.application.routes.draw do
  use_doorkeeper

  jsonapi_resources :campaigns
  jsonapi_resources :chapters
  jsonapi_resources :locations
  jsonapi_resources :players
  jsonapi_resources :users, only: %i[show create update destroy]

  get '/me', to: 'sessions#me'
end
