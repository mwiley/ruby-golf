Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'challenges#index'
  resources :challenges do
    resources :submissions
  end

end
