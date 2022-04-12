class User < ApplicationRecord
  validates :email, presence: ture, uniqueness: true
  validates :username, presence: ture, uniqueness: true
  validates :password, presence: ture
end
