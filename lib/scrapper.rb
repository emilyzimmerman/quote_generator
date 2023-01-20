require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative "quote.rb"


class Scrapper 
    SCRAPE_URL = "http://quotes.toscrape.com/"

    def self.scrape_quote
        puts "Scraping quotes"
        # retrieve all quote elements from URL
        doc = Nokogiri::HTML(URI.open("http://quotes.toscrape.com/"))
        # array of quote elements
        quote_content = doc.css(".quote").text
        quote_author = doc.css(".author").text
        quote_tags = doc.css(".tags").text

        Quote.new(quote_content, quote_author, quote_tags)
    end
end
binding.pry
