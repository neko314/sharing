# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "users#show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :groups do
    resources :tasks
    resources :assignments, only: [:edit, :update]
    resources :memberships, only: [:create, :destroy], module: "groups"
  end
end
