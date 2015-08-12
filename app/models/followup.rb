class Followup < ActiveRecord::Base
	belongs_to :contact
	belongs_to :case
end
