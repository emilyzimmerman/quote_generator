require_relative "quote.rb"

class CLI
    def run 
        while user_choice != "exit"
            greeting 
            list_options
            user_choice
        end
        end_program 
    end

    def greeting 
        puts "Welcome to the quote generator"
    end

    def user_choice
         answer = gets.chomp 
         pick_choice(answer)
         return answer
    end

    def list_options
        puts "How can I help you?"
        puts " > 1. Show you a quote"
        puts " > 2. Show you all the quotes"

    end

    def pick_choice(answer)
        case answer
        when "1"
            puts "Showing you a quote:"
        when "2"
            puts "Here's all the quotes"
            quotes = Quote.all[0..10]
            puts quotes

        end
    end

    def end_program
        puts "Bye!"
    end

end

