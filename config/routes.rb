Rails.application.routes.draw do
  mount_ember_app :stage, to: "/"

  jsonapi_resources :blue_books
  jsonapi_resources :campaigns
  jsonapi_resources :chapters
  jsonapi_resources :setting_details
  jsonapi_resources :users, only: %i[show new update destroy]
end
