class TwitterApi
  include HTTParty

  def get_user_from_token(token)
    url = 'https://api.twitter.com/2/users/me?user.fields=profile_image_url'

    headers = { 'Authorization': "Bearer #{token}" }

    response = HTTParty.get(url, headers: headers)
    data = JSON.parse response.body
    data['data']
  end

  def get_new_access_token_from_refresh_token(refresh_token)
    puts refresh_token
    url = "https://api.twitter.com/2/oauth2/token?client_id=c1cyWWlWR19la1d1X2FoSk5qSXA6MTpjaQ&grant_type=refresh_token&refresh_token=#{refresh_token}"

    headers = { 'Content-Type': 'application/x-www-form-urlencoded' }

    response = HTTParty.post(url, headers: headers)
    data = JSON.parse response.body
    puts data
    data
  end
end
