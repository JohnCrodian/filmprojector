class ScreeningsController < ApplicationController
http_basic_authenticate_with :name => "JohnisKing", :password => "password", only: [:new]
  def new
    @screening = Screening.new
  end

  def create
    @screening = Screening.new(screening_params)
    @screening.save
  end


  def show
  	@screenings = Screening.order(:showtime)
  end


  def scrape_bryn_mawr
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.brynmawrfilm.org/films/?cat=9"))
    screening = doc.css('.highlight')
    screening.each do |entry|
    	title = entry.css('b').text
    	showtime = DateTime.parse(entry.xpath('.//a/text()[normalize-space()]').text).to_date
    	location = "Bryn Mawr Film Institute"
     	linkleader = "http://www.brynmawrfilm.org/"
     	link = linkleader << entry.css('a')[0]['href']
		Screening.create(title: title, showtime: showtime, location: location, link: link).valid?      	
   end
   redirect_to '/'
end

    def scrape_roxy
      require 'open-uri'
      doc = Nokogiri::HTML(open("http://filmadelphia.org/signature-series/"))
      screening = doc.css('h5')
      screening.each do |entry|
        title = entry.xpath('.//a/br/preceding-sibling::text()').text.titleize
        showtime = DateTime.parse(entry.xpath('.//a/text()').text).to_date
        location = "Roxy Theatre"
        link = entry.css('a')[0]['href']
        Screening.create(title: title, showtime: showtime, location: location, link: link).valid?
      end
redirect_to '/'
end


      def scrape_ambler
        require 'open-uri'

        doc = Nokogiri::HTML(open("http://amblertheater.org/events"))
        screening = doc.css('tr')

        screening.each_with_index do |entry, index|

          title = entry.css('.title').text
          location = "The Ambler Theater"
          linkleader = "http://www.amblertheater.org"
          link = linkleader << entry.css('a')[0]['href']
          iframe = Nokogiri::HTML(open("http://amblertheater.org/eventshowtimes#{index}.php"))
          showtime = iframe.css('#specialday').text.to_date
          Screening.create(title: title, showtime: showtime, location: location, link: link).valid?
        end
        redirect_to '/'
      end

      def scrape_ihouse
        require 'open-uri'
        ["1", "2", "3", "4"].each do |page|
          doc = Nokogiri::HTML(open("http://ihousephilly.org/calendar?page=#{page}&tag=film"))
          screening = doc.css('.event-preview-container')

          screening.each do |entry|
            title = entry.css('.event-title').text.encode
            showtime = DateTime.parse(entry.css('.event-details').text).to_date
            location = "International House"
            linkleader = "http://www.ihousephilly.org"
            link = linkleader << entry.css('a')[0]['href']
            Screening.create(title: title, showtime: showtime, location: location, link: link).valid?
          end
        end
        redirect_to '/'
      end


        def scrape_colonial
          require 'open-uri'

          ["classics", "fright-night", "cult-cinema", "young-audiences"].each do |page|
            doc = Nokogiri::HTML(open("https://thecolonialtheatre.com/programs-categories/programs-#{page}/"))
            screening = doc.css('.entry-header-other')
            screening.each do |entry|
              title = entry.css('.entry-title').text
              showtime = entry.css('.program-dates').text
              location = "The Colonial Theatre"
       		  link = entry.css('a')[0]['href']
              Screening.create(title: title, showtime: showtime, location: location, link: link).valid?
            end
          end
          redirect_to '/'
        end
    end

private 

 def screening_params
  params.require(:screening).permit(:title, :showtime, :location, :link)
end
