# frozen_string_literal: true

require_relative "quote_generator/version"
require_relative "cli.rb"
require_relative "quote.rb"
require_relative "scrapper.rb"
require_relative "auth.rb"
require_relative "user.rb"

module QuoteGenerator
  class Error < StandardError; end
  # Your code goes here...
end
