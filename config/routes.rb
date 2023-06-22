# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root 'users#index'
  get '/api/users/:user_id/posts', to: 'api#user_posts'
  get '/api/posts/:post_id/comments', to: 'api#post_comments'
  post '/api/comment/new', to: 'api#add_comment'
  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create]
    end
    end

  resources :likes, only: [:create]
end
