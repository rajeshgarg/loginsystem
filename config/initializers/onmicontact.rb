require "omnicontacts"
Rails.application.config.middleware.use OmniContacts::Builder do
  importer :gmail, "client_id", "client_secret", {:redirect_path => "/oauth2callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
  importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  importer :hotmail, "client_id", "client_secret"
  importer :facebook, "211100652323479", "d1e81813c0e7e63fb2411fbdb8c6314b"
  # importer :twitter, "lRVVCE3upompJAoXQNKOA", "WVFC0EhdtinbgHBstJrViwovNHok6Y7erxtpczfQbRU"

end