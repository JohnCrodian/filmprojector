class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def search 
    year = params[:search]["date(1i)"]
    month = params[:search]["date(2i)"]
    	if month.length < 2
    		month = "0" + month
    	end
    day = params[:search]["date(3i)"]
    date = "#{year}-#{month}-#{day}"
    @searchDate = date.to_date.strftime("%m/%d/%y")
    @screenings = Screening.where("showtime LIKE (?)", date)

  end



end
