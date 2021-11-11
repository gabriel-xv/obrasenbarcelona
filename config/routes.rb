Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  root to: 'pages#home'
  resources :articles
  resources :contacts, only: [:new, :create]
  get "/pages/:page" => "pages#show"
  match "/404", via: :all, to: "errors#not_found"
  match "/500", via: :all, to: "errors#internal_server_error"
end
