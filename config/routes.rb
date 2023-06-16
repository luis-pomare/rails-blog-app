# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create]
    end
    end

  resources :likes, only: [:create]
end
