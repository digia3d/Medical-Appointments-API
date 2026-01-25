Rails.application.routes.draw do
  get '/favicon.ico', to: proc { [204, {}, []] }

  namespace :api do
    namespace :v1 do
      resources :doctors, only: %i[index show create]
      resources :users, only: %i[index show create]

      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
