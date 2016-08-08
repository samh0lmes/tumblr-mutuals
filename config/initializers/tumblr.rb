# Tumblr.configure do |config|
#   config.consumer_key = ENV['CONSUMER_KEY']
#   config.consumer_secret = ENV['CONSUMER_SECRET']
#   config.oauth_token = ENV['OAUTH_TOKEN']
#   config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tumblr, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end

# $tumblr = Tumblr::Client.new
