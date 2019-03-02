# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :day
end
