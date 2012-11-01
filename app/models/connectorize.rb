class Connectorize < ActiveRecord::Base
	attr_accessible :connectee1, :connectee1_accept, :connectee1_email, :connectee2, :connectee2_accept, :connector, :connector2_email, :connector_email, :reason
	
	validates :reason, :length => { :maximum => 140,
									:too_long => " The maximum characters is %{count}. "}

end
