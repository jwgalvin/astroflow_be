Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'users#create'

  namespace :api do
    namespace :v1 do
      get "/horoscopes/find", to: 'horoscopes#index'
      post "users/daily_flow_chart", to: 'daily_flow_chart#create'
      resources :users, only: [:create] do
        resources :notes, only: [:index, :create]
      end
      resources :moon
    end
  end
end
