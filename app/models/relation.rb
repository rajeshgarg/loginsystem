class Relation < ActiveRecord::Base
	# belongs_to :client
	# belongs_to :trainer
	belongs_to :client, :class_name => "User"
  belongs_to :trainer, :class_name => "User"
end
