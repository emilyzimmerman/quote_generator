require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative "quote.rb"


class Scrapper 
    puts "Scraping Quotes..."
    SCRAPE_URL = "http://quotes.toscrape.com/"

    def self.scrape_quote
        puts "Scraping quotes"
        # retrieve all quote elements from URL
        doc = Nokogiri::HTML(URI.open("http://quotes.toscrape.com/"))
        # array of quote elements
        quote_element = doc.css(".quote")

        #This allows ruby to access the quote class & loop through each quote rather than all of them at once
        quote_element.each do |element|
           quote_content = element.css(".text").text
           quote_author = element.css(".author").text
           quote_tags = element.css(".tags").text

           Quote.new(quote_content, quote_author, quote_tags) 
        end
    end

    def self.scrape_info
        scrape_quote
    end
end
