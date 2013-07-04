class Organisation < ActiveRecord::Base
  has_many :users
  attr_protected :id
  attr_accessible :name
end
