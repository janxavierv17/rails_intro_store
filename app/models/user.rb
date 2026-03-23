class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 3..25 }
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
