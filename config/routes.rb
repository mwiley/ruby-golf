Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'challenges#index'
  get 'about/' => 'pages#about', as: 'about_page'

  resources :challenges do
    resources :submissions
  end

end
