Rails.application.routes.draw do
  get '/favicon.ico', to: proc { [204, {}, []] }

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login'
      resources :users, only: %i[index show create destroy]
      resources :doctors, only: %i[index show create destroy]
      resources :appointments, only: %i[index show create destroy]

      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
