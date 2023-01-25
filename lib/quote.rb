class Quote 
    attr_accessor :content, :author, :tags 

    @@quotes = []

    def initialize (quote_content, quote_author, quote_tags)
        @content = quote_content
        @author = quote_author
        @tags = quote_tags

        #pushes instance into array
        @@quotes  << self

    end

    #creates class method
    def self.all 
        return @@quotes
    end
end

# random_quote = Quote.new("This is a test", "Joe", "work")

# puts "Here's the quotes: " + random_quote.content

puts Quote.all