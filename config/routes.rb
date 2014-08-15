Rails.application.routes.draw do
  root to: 'lists#index'

  # oauth
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy"
  get '/auth/failure' => 'sessions#failure'

  resources :lists
end
