# frozen_string_literal: true

FactoryBot.define do
  factory :assignment do
    user_id { 1 }
    task_id { 1 }
    day_id { 1 }
  end
end
