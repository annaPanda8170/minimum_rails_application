Rails.application.routes.draw do
  resources :messages, only: [:index, :new, :create]
  devise_for :users
  root "messages#index"
end
