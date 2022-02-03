Rails.application.routes.draw do
  resources :points
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
