Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#show'
      post '/road_trip', to: 'road_trips#index'
    end
  end
end
