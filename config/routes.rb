Rails.application.routes.draw do
  get "/" => "restaurants#index"
  get "/restaurants" => "restaurants#index"
  get "/restaurantsall" => "restaurants#home"
  get "/restaurants/:id" => "restaurants#show"
  get "/oysterroulette" => "restaurants#filter"
  get "/smh" => "restaurants#smh"

  get "/newreview" => "oyster_reviews#new"
  post "/oysterreviews" => "oyster_reviews#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/userrewards" => "users#show"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  namespace :api do 
    namespace :v1 do 
      get "/restaurants" => "restaurants#index"
    end 
  end 
end
