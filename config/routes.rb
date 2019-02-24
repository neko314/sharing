# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"
  devise_for :users
  resources :users
end
