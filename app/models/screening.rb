class Screening < ApplicationRecord
	validates_uniqueness_of :link
	

	def start_time
     	self.showtime
    end
end
