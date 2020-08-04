Rails.application.routes.draw do
  # get '/api/v1/forecast', to: ''
  namespace :api do
    namespace :v1 do
      resources :forecast
      resources :backgrounds
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
