Rails.application.routes.draw do
  root to: 'genres#index'
  resources :genres do
    resources :categories do
      resources :items
    end
  end
end

