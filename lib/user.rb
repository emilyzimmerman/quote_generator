require "pry"
require_relative 'auth.rb'

class User 
    extend Auth 
    attr_accessor :d, :username, :password

    @@users = []

    def initialize(username, password)
        @username = username 
        @password = password
        @id = User.all.count 
        @@users << self 
    end

    #return all users from users array 
    def self.all 
        @@users
    end

    #populate users array
    def self.seed 
        users = [{username: "user123", password: "password"}, {username: "another123", password: "password1"}]

        i = 0 

        while i< users.count 
            user = users[i]
            User.new(user[:username], create_hash_digest(user[:password]))
            i += 1 
        end
    end
    
    def self.find(id)
        self.all.find {|user| user.id == id } 
    end
end
