Rails.application.routes.draw do
  resources :messages, only: [:index, :create]
  devise_for :users
  root "messages#index"
end
