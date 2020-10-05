class UsersController < ApplicationController
    def index
      
        users = HTTParty.get('https://jsonplaceholder.typicode.com/users')
    
        @userlist = []
    
        users.each do |user|
    
          hash = Hash.new
    
          iduser = user["id"].to_s
          postsuser = HTTParty.get('https://jsonplaceholder.typicode.com/users/'+ iduser +'/posts')
          nposts = 0
    
          postsuser.each do |count|
            nposts += 1
          end
    
          hash["name"] = user["name"]
          hash["username"] = user["username"]
          hash["email"] = user["email"]
          hash["address"]= user["address"]
          hash["phone"] = user["phone"]
          hash["website"] = user["website"]
          hash["company"] = user["company"]
          hash["nposts"] = nposts.to_s
    
          @userlist.push(hash)
        
        
        end
    
    
      end
end
