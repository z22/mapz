Rails.application.config.middleware.use OmniAuth::Builder do |variable|
  provider :twitter, 'jzXndcxJoSjsoA6wmSgjJylVT', 'Jn2RnC6k8OB0vdqjfjdABoYaeOWSCR1OHMTMGMU8TBfrilVyfe'
end