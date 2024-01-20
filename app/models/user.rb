class User < ApplicationRecord
  has_secure_password
  validates :nickname, :password_digest, presence: { message: 'cannot be empty' }
end
