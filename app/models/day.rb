# frozen_string_literal: true

class Group < ApplicationRecord
  has_and_belongs_to_many :tasks
end
