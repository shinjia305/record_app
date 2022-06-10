Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  devise_for :admins, controllers: { 
    sessions: 'admins/sessions',
    registrations: 'admins/registrations' }
  root "users#index"
  resources :users
end
