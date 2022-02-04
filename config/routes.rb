Rails.application.routes.draw do
  resources :sessions, only: %i[index show create]
  post '/sessions/:id/stop', to: 'sessions#update'
  resources :points
  # Defines the root path route ("/")
  # root "articles#index"
end
