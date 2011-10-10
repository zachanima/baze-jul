Jul::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :shops, only: [:show] do
    resources :products, only: [:index]
  end
end
