# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    resources :posts
  end

  resources :likes, only: [:create]
  resources :commetns, only: [:new, :create]
end
