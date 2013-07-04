# require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do 
  # provide Site URL as http://localhost:3000/ in your facebook app. Now you will be able to access it from your development machine
  # facebook_options = {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}, :scope => ''}

  provider :twitter, 'lRVVCE3upompJAoXQNKOA', 'WVFC0EhdtinbgHBstJrViwovNHok6Y7erxtpczfQbRU'
  # provider :facebook, 'APP_ID', 'APP_SECRET', facebook_options
  # provider :linked_in, 'KEY', 'SECRET'

  # provider :open_id,  OpenID::Store::Filesystem.new('/tmp')
end

# you will be able to access the above providers by the following url
# /auth/providername for example /auth/twitter /auth/facebook





Rails.application.config.middleware do  
  # use OmniAuth::Strategies::OpenID,  OpenID::Store::Filesystem.new('/tmp'), :name => "google",  :identifier => "https://www.google.com/accounts/o8/id"
  # use OmniAuth::Strategies::OpenID,  OpenID::Store::Filesystem.new('/tmp'), :name => "yahoo",   :identifier => "https://me.yahoo.com"
  # use OmniAuth::Strategies::OpenID,  OpenID::Store::Filesystem.new('/tmp'), :name => "aol",     :identifier => "https://openid.aol.com"
  # use OmniAuth::Strategies::OpenID,  OpenID::Store::Filesystem.new('/tmp'), :name => "myspace", :identifier => "http://myspace.com"
end

 

# you won't be able to access the openid urls like /auth/google
# you will be able to access them through
# /auth/open_id?openid_url=https://www.google.com/accounts/o8/id
# /auth/open_id?openid_url=https://me.yahoo.com
