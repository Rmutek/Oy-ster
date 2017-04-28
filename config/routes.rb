Rails.application.routes.draw do
  get "/" => "restaurants#index"
  get "/restaurants" => "restaurants#index"
  get "/restaurants/:id" => "restaurants#show"

  get "/newreview" => "oyster_reviews#new"
  post "/oysterreviews" => "oyster_reviews#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
