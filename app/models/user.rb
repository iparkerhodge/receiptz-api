class User < ApplicationRecord
  has_secure_password
  attr_accessor :password_digest, :receiptz_token

  has_many :receipts
end
