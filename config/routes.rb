Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  root to: 'pages#home'
  resources :articles
  resources :contacts, only: [:new, :create]
  get "/pages/:page" => "pages#show"
end
