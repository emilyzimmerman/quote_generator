require_relative "quote.rb"

class CLI
    attr_accessor :user
    def run 
        Scrapper.scrape_info
        User.seed
        system("clear")
        hello
        login_or_signup 
        while user_choice != "exit"
            greeting 
            list_options
            user_choice
        end
        end_program 
    end

    def login_or_signup
        response = ''

        while response != 'login' && response != 'signup'
            puts "Would you like to login or signup"
            response = gets.chomp
        end

        if response == 'signup'
            signup
        else
            login 
        end
    end

    def signup
        puts "Let's signup!"
        puts "Enter your username"
        username = gets.chomp 
        puts "Enter your password"
        password = gets.chomp 
        User.new(username, password)
        login 
    end

    def login
        authenticated = false 

        while authenticated != true
            puts "Please login"
            puts "> What is your username?"
            username = gets.chomp 
            puts ">What is your password?"
            password = gets.chomp 
            curUser = Auth.auth_user(User.all, username, password)
           
            if curUser
                puts "Login successful"
                authenticated = true
                @user = curUser
            else 
                puts "Login error"
            end
        end
    end

    def hello 
        puts "Hello! Ready to login?"
    end

    def greeting 
        puts "Welcome #{user.username} to the quote generator"
    end

    def user_choice
         answer = gets.chomp 
         pick_choice(answer)
         return answer
    end

    def list_options
        puts "How can I help you?"
        puts " > 1. See all the quotes and information"
        puts " > 2. See a specific quote"
        puts " > 3. See quotes with specific tag"

    end

    def pick_choice(answer)
        case answer
        when "1"
            puts "Here are all the quotes:"
            Quote.all.each_with_index do |quote, i|
                puts "#{i + 1}.#{quote.content}"
                puts "Here are the authors:"
                puts "#{i + 1}.#{quote.author}"
                puts "Here are all the tags:"
                puts "#{i + 1}.#{quote.tags}"
            end

        when "2"
            puts "What quote would you like to see? (insert a number)"
            quote_index = gets.chomp.to_i
            selected_quote = Quote.all[quote_index - 1]
            puts selected_quote.content.tags
            puts selected_quote.author
            puts selected_quote.tags

        when "3"
            puts 'What tag are you looking for?'
            all_quote_tags = Quote.all
            picked_tags = gets.chomp 
            if all_quote_tags.include? picked_tags
                puts "This tag is exist"
            else 
                puts "Sorry this tag doesn't exist"
            end
        end
    end

    def end_program
        puts "Bye! Have a good day."
    end

end

