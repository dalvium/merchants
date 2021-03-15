Rails.application.routes.draw do
  devise_for :merchants
  resources :merchants
  root to: 'merchants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
