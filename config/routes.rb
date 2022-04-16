Rails.application.routes.draw do


  get '/auth/google_oauth2/callback', to: 'users#create'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :notes, only: [:index, :create]
      end
    end
  end
end
