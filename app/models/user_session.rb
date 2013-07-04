class UserSession < Authlogic::Session::Base
  # attr_accessible :title, :body
  # oauth2_client_id      "APPLICATION_ID"
  # oauth2_client_secret  "APPLICATION_SECRET"
  # oauth2_site           "https://graph.facebook.com"
  # oauth2_scope          "offline_access,email,user_birthday"
  def to_key
     new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
    
def self.oauth_consumer
  OAuth::Consumer.new("lRVVCE3upompJAoXQNKOA", "WVFC0EhdtinbgHBstJrViwovNHok6Y7erxtpczfQbRU",
      { :site => "https://api.twitter.com",
        :authorize_url => "https://api.twitter.com/oauth/authenticate"
        # :authorize_url =>"https://api.twitter.com/oauth/request_token"
        })
end
  # def persisted?
  #   false
  # end

end
# class UserSession < Authlogic::Session::Base
#   def self.oauth_consumer
#     OAuth::Consumer.new("z22sSQlQMptg2u0A2wK4w", "hMbGnTbY5nDBMTQq0OLiveDBnqD4BUYQEfTzk5N0wg",
#     { :site=>"http://twitter.com",
#       :authorize_url => "https://api.twitter.com/oauth/authorize" })
#   end
# end
