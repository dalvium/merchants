Rails.application.routes.draw do
  devise_for :merchants, :path_prefix => 'auth'
  resources :merchants
  root to: 'merchants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
