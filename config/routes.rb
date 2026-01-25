Rails.application.routes.draw do
  resources :users, only: %i[index show create]

  # Defines the root path route ("/")
  # root "articles#index"
end
