class User < ApplicationRecord
  has_secure_password
  validates :nickname, :password_digest, presence: { message: 'cannot be empty' }
  has_many :Values, dependent: :destroy
  has_many :Definitions, dependent: :destroy
end
