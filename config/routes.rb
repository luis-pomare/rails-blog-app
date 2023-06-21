# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root 'users#index'
  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create]
    end
    end

  resources :likes, only: [:create]
end
