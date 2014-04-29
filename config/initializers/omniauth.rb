Rails.application.config.middleware.use OmniAuth::Builder do |variable|
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end