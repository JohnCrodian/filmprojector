require 'open-uri'
require 'nokogiri'

class Entry
    def initialize(title, showtime, location, link)
      @title = title
      @showtime = showtime
      @location = location
      @link = link
      Screening.create(title: @title, showtime: @showtime, location: @location, link: @link)
    end
    attr_reader :title
    attr_reader :showtime
    attr_reader :location
    attr_reader :link
  end


def scrape_bryn_mawr
  
  doc = Nokogiri::HTML(open("http://www.brynmawrfilm.org/films/?cat=9")) 

    screening = doc.css('.highlight')
    screening.each do |entry|
      title = entry.css('b').text
      showtime = entry.xpath('.//a/text()[normalize-space()]').text
      location = "Bryn Mawr Film Institute"
      link = entry.css('a')[0]['href']
      Entry.new(title, showtime, location, link)
    end
end


def scrape_ihouse
 

 ["1", "2", "3", "4"].each do |page|
  doc = Nokogiri::HTML(open("http://ihousephilly.org/calendar?page=#{page}&tag=film")) 
    screening = doc.css('.event-preview-container')
    screening.each do |entry|
      title = entry.css('.event-title').text 
      showtime = DateTime.parse(entry.css('.event-details').text).to_date
      location = "International House"
      link = entry.css('a')[0]['href']
      Entry.new(title, showtime, location, link)
  		end
  	end
 end

def scrape_colonial

	["classics", "fright-night", "cult-cinema", "young-audiences"].each do |page|
		doc = Nokogiri::HTML(open("https://thecolonialtheatre.com/programs-categories/programs-#{page}/")) 
		screening = doc.css('.entry-header-other')
    		screening.each do |entry|
      			title = entry.css('.entry-title').text 
      			showtime = entry.css('.program-dates').text
      			location = "The Colonial Theatre"
      			link = entry.css('a')[0]['href']
      			Entry.new(title, showtime, location, link)
  		end
	end
end


