# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "users#show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :groups do
    resources :tasks
    resources :assignments
    post "invitation", to: "groups/invitations#create", as: :invitation
    get "exit", to: "groups/exits#create", as: :exit
  end
end
