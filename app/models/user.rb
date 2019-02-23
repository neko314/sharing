class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true
end