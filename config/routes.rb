Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root "users#index"\

  resources :users
  resources :admins, only: [:show]

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations' }
end
