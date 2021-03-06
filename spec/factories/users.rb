# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "testuser" }
    email { "testuser@example.com" }
    password { "password" }
  end
end
