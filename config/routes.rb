# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :users, only: [:show]
  resources :groups do
    resources :tasks
    resources :assignments
    post "invitation", to: "groups/invitations#create", as: :invitation
    get "exit", to: "groups/exits#create", as: :exit
  end
end
