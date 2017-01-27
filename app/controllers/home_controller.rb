class HomeController < ApplicationController

def index
	@screenings_today = Screening.where(showtime: Date.today)
	end

end

