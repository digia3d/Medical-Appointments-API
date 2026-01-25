Rails.application.routes.draw do
  get '/favicon.ico', to: proc { [204, {}, []] }
  
  resources :doctors, only: %i[index show create]
  resources :users, only: %i[index show create]

  # Defines the root path route ("/")
  # root "articles#index"
end
