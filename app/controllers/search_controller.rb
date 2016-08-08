class SearchController < ApplicationController

  def index
    @info = "test"
  end

  def show
    auth_hash = request.env['omniauth.auth']
    Tumblr.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = auth_hash.credentials.token
      config.oauth_token_secret = auth_hash.credentials.secret
    end
    client = Tumblr::Client.new
    mutuals = get_mutuals(client)
    @client = mutuals
  end

  def get_mutuals(client)
    blog = client.info["user"]["name"]
    num_following = client.followers("#{blog}.tumblr.com")["total_users"]
    mutuals = []
    i = 0
    while i < num_following
      mutuals += client.followers("#{blog}.tumblr.com", offset: i)["users"].select {|user| user["following"] == true}
      i += 20
    end
    return mutuals
  end

end