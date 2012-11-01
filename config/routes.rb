Serveme::Application.routes.draw do

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