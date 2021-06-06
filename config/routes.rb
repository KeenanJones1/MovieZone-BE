Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:create, :index]

  
  resources :users, only: [:show, :create]
  root to: "movies#index"
end
