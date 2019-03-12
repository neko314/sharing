# frozen_string_literal: true

class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
end
