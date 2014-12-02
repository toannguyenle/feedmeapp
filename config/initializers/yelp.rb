require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = ENV["YP_CONSUMER_KEY"]
  config.consumer_secret = ENV["YP_CONSUMER_SECRET"]
  config.token = ENV["YP_TOKEN"]
  config.token_secret = ENV["YP_TOKEN_SECRET"]
end