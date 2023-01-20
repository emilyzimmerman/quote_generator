class Quote 
    attr_accessor :text, :author, :tags 

    @@quotes = []

    def initialize (quote_content, quote_author, quote_tags)
        @text = quote_content
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

random_quote = Quote.new("This is a quote", "James Bond", "Action")

# puts "Here's the quotes: " + random_quote.text

# puts Quote.all