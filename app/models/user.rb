class User < ApplicationRecord
  attr_accessor :access_token, :access_token_issued_at, :refresh_token
end
