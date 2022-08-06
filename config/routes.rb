Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors, :books, :operators, :customers, :comments

  root "customers#index"

  devise_for :customers, path: 'customers_auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'cmon_let_me_in' }

  devise_for :operators, path: 'operators_auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'cmon_let_me_in' }
end
