class HomeController < ApplicationController

def index
	@screenings_today = Screening.where(showtime: Date.today)
	@posts = Post.all
	end

end

