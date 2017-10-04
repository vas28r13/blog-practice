Rails.application.routes.draw do
  devise_for :users
  resources :posts
  
  root to: "posts#index"
  
  get "api/v1/weather" => "api/v1/weather#get_weather"
  get "weather" => "api/v1/weather#index"
end
