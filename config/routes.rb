# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :users, only: [:show]
  resources :groups do
    resources :tasks
    post "invitation", to: "invitations#create", as: :invitation
    get "exit", to: "exits#create", as: :exit
  end
end
