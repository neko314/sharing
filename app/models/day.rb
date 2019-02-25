# frozen_string_literal: true

class Day < ApplicationRecord
  has_and_belongs_to_many :tasks
end
