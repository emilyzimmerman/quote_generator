require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative "quote.rb"


class Scrapper 
    SCRAPE_URL = "http://quotes.toscrape.com/"

    def self.scrape_quote
        # doc = Nokogiri::HTML(URI.open("http://quotes.toscrape.com/"))
        # retrieve all quote elements from URL
        doc = Nokogiri::HTML(URI.open("http://quotes.toscrape.com/"))
        # array of quote elements
        quote_elements = doc.css(".quote")

        # iterating through the quotes array 
        quote_elements.each do |quote_element| 
            puts quote_element.css(".text").text
        end

        return
    end
end
