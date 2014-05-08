

Rails.application.config.middleware.use OmniAuth::Builder do |variable|
  provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    #allows access to the user's data even when they're not at the browser
    access_type: 'offline',
    #need to include email
    scope: 'email https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/plus.me',
    prompt: 'consent',
    redirect_uri:'http://localhost:3000/auth/google_oauth2/callback'
  }
end