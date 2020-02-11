class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  has_many :articles
  has_many :comments
end
