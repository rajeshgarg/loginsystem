class User < ActiveRecord::Base
  acts_as_authentic 
  attr_protected :id
  has_many :authorizations, :dependent => :destroy
  belongs_to :organisation
  
  has_many     :client_trainer,
               :class_name            => "Relation",
               :foreign_key           => :client_id,
               :dependent             => :destroy

  has_many     :trainers,
               :through               => :client_trainer,
               :source                => :trainer

  has_many     :trainer_client,
               :class_name            => "Relation",
               :foreign_key           => :trainer_id,
               :dependent             => :destroy
  has_many     :clients,
               :through               => :trainer_client,
               :source                => :client

def self.create_from_hash(hash)
    user = User.new(:login => hash.info.name,:email=>hash.uid+"@gmail.com",:password_confirmation=>hash.extra.access_token.token, :password=>hash.extra.access_token.token)
    user.save #create the user without performing validations. This is because most of the fields are not set.
    
    user.reset_persistence_token! #set persistence_token else sessions will not be created
    user
  end
end

