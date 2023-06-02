class TwitterApi
  include HTTParty

  def get_user_from_token(token)
    url = 'https://api.twitter.com/2/users/me'
    puts token

    headers = { 'Authorization': "Bearer #{token}" }

    response = HTTParty.get(url, headers: headers)
    data = JSON.parse response.body
    data['data']
  end
end
