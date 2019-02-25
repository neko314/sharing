# frozen_string_literal: true

class Day < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :days
end
