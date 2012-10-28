Serveme::Application.routes.draw do


  resources :organisations do
    resources :places
  end

  authenticated :user do
    root :to => 'organisations#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end