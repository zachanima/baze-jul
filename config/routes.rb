Jul::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :shops, only: [:show] do
    resources :products, only: [:index, :show] do
      resources :orders, only: [:create]
    end
    member do
      devise_for :customers, controllers: { sessions: 'customer/sessions' }
    end
  end

  match '/:id', to: 'shops#show'
end
