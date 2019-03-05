# frozen_string_literal: true

class Day < ApplicationRecord
  has_many :tasks, through: :assignments
end
