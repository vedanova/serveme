Serveme::Application.routes.draw do

  namespace :monitor do
    resources :dashboard, only: :index
  end

  resources :feedbacks

  resources :requests

  resources :sites do
    resources :places
  end

  resources :organisations do
    resources :sites
  end

  authenticated :user do
    root :to => 'organisations#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end