# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :days
  has_many :users, through: :assignments
end
