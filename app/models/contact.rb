class Contact < ActiveRecord::Base
	belongs_to :user
	enum contact_type: [ :end_client, :outsourcing_firm]  #default 1 = End Client'
	
	def to_bool
    return true if self == true || self =~ (/^(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/^(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end