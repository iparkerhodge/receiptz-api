class User < ApplicationRecord
  alias_attribute :twitter_profile_image_url, :twitter_profile_image
  attr_accessor :access_token, :access_token_issued_at, :refresh_token
end
