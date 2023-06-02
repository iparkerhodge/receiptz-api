class UserSerializer < ActiveModel::Serializer
  attributes :id, :twitter_id, :twitter_username,
             :twitter_name, :access_token, :refresh_token,
             :access_token_issued_at, :twitter_profile_image
end
