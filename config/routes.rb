# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resource :profile, only: :show

  namespace 'my' do
    resource :posts, only: :show
  end

  resources :posts, except: :index do
    scope module: :posts do
      resources :likes, only: %i[create destroy]
      resources :comments, only: :create
    end
  end
end
