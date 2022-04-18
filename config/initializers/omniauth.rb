Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?  
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user,repo,gist"
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
    scope: 'email,user_birthday,read_stream', display: 'popup'
  end