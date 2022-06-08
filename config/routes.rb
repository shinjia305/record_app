Rails.application.routes.draw do
  devise_for :admins
  root "users#index"
  resources :users
end
