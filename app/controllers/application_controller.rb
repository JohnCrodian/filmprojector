class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def search 

    date = params[:search][:date]
    year = date.last(4).to_s
    month = date.first(2).to_s
    month_remove = date.last(7).to_s
    day = month_remove.first(2).to_s
	datebuild = "#{year}" "-" "#{month}" "-" "#{day}"
	standardDate = datebuild.to_date
    @searchDate = standardDate.strftime('%A, %B %d')
    @screenings = Screening.where("showtime LIKE (?)", standardDate)


  end

end

#params are coming in as string month/day/year, i.e. "02/04/2017"
#standardized date for screening entries is year/month/day "2017-02-04"
