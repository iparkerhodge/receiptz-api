class User < ApplicationRecord
  has_secure_password
  attr_accessor :receiptz_token, :password_digest

  has_many :receipts
end
