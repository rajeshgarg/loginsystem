class UserSession < Authlogic::Session::Base
  # attr_accessible :title, :body
  # oauth2_client_id      "APPLICATION_ID"
  # oauth2_client_secret  "APPLICATION_SECRET"
  # oauth2_site           "https://graph.facebook.com"
  # oauth2_scope          "offline_access,email,user_birthday"
  def to_key
     new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
    

  # def persisted?
  #   false
  # end

end
