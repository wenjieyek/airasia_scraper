require "watir"
require "nokogiri"
require "airasia_scraper/version"

module AirasiaScraper
  class Client 
    def initialize(depart_date, from, to)
      @depart_date = depart_date.upcase
      @from = from
      @to = to
    end

    def flight_data
      flight_page_html = get_flight_page_html

      flight_page_html.css(".flight-schedule").map do |flight_page_html|
        flight_message = flight_page_html.content.split(" ")
        depart_time = flight_message[1].delete(".")
        arrive_time = flight_message[3].delete(".")
        fare = flight_message.last
        return_flight_data_hash(depart_time, arrive_time, fare)
      end
    end

    private
    def get_flight_page_html
      browser = Watir::Browser.new
      browser.goto "https://www.airasia.com/select/en/gb/#{@from}/#{@to}/#{@depart_date}/N/1/0/0/O/N/MYR/ST?key=ba68bcc7-87d7-11ea-8cc4-c9875338e7591587917120.34"
      sleep 30
      Nokogiri::HTML(browser.html)
    end

    def return_flight_data_hash(depart_time, arrive_time, fare)
      { depart_time: depart_time, arrive_time: arrive_time, fare: fare }
    end
  end
end
