class TwitterApi
  include HTTParty

  def get_user_from_token(token)
    url = 'https://api.twitter.com/2/users/me?user.fields=profile_image_url'
    puts token

    headers = { 'Authorization': "Bearer #{token}" }

    response = HTTParty.get(url, headers: headers)
    data = JSON.parse response.body
    data['data']
  end
end
