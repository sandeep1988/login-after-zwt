class Contact < ActiveRecord::Base
	belongs_to :user
	# enum contact_type: [ :end_client, :outsourcing_firm]  #default 1 = End Client'
end