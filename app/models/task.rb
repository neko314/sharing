# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :group
  has_many :users, through: :assignments
  has_many :assignments, dependent: :destroy
  accepts_nested_attributes_for :assignments, allow_destroy: true, reject_if: :all_blank
  has_many :days, through: :assignments
  
  validates :name, presence: true
end
