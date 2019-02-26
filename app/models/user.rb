# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_many :assignments
  has_many :tasks, through: :assignments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
end
