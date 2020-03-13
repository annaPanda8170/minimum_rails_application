Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root "messages#index"
end
