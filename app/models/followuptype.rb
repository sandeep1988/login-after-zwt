class Followuptype < ActiveRecord::Base
	validates_uniqueness_of :v_title
	validates :v_title, presence: true
end
