Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast
      resources :backgrounds
      resources :users
      resources :trails
    end
  end
end
