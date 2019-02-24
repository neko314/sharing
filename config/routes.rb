# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :users, only: [:show]
  resources :groups
end
