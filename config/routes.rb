Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :posts, only: [:index]
  resources :trends, only: [:index]
  resources :influencers, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
