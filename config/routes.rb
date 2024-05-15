Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords',
    omniauth_callbacks: 'admin_users/omniauth_callbacks'
  }

  resources :projects
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :students
  root 'welcome#index'

  namespace :admin do
    resources :students
    resources :projects
    resources :courses
    resources :blogs
    get 'dashboard' => 'dashboard#index'
  end
end
