class Screening < ApplicationRecord
	has_and_belongs_to_many :posts
	validates_uniqueness_of :link
	

	def start_time
     	self.showtime
    end
end
