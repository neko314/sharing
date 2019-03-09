# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "users#show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :groups do
    resources :tasks
    resources :assignments
    post "invitation", to: "groups/memberships#create", as: :invitation
    get "exit", to: "groups/memberships#destroy", as: :exit
  end
end
