Rails.application.routes.draw do
  root to: 'genres#index'
  resources :genres, except: [:show] do
    resources :categories, except: [:show] do
      resources :items, except: [:show]
    end
  end
  resources :categories, only: [:index]
end

