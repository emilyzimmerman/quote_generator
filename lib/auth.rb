require "bcrypt"
require "pry"

module Auth 
    def create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    def self.auth_user(users, username, password)
        curUser = nil 
        users.each do |user|
            if user.username == username && user.password == password
                curUser = user
                break; 
            end
        end
        
        return curUser
    end
end
