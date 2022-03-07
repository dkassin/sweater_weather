Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :book_searches, path: "book-search" do
        collection do
          get 'book-search', to: :book_searches
        end
      end
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#show'
    end
  end
end
