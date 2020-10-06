class InfluencersController < ApplicationController
    def index

        users = HTTParty.get('https://jsonplaceholder.typicode.com/users')
    
        @influencers = []
    
        users.each do |user|
          hash = Hash.new
          
          iduser = user["id"].to_s
          
          postsuser = HTTParty.get('https://jsonplaceholder.typicode.com/users/'+ iduser +'/posts')
          
          nposts = 0
          ncomtarios = 0
          
          postsuser.each do |postuser|
    
            idpost = postuser["id"].to_s
            comentariosposts = HTTParty.get("https://jsonplaceholder.typicode.com/posts/"+ idpost +"/comments")
            
    
            comentariosposts.each do |count|
              ncomtarios += 1
            end
    
            nposts += 1
            
          end
          
          hash["name"] = user["name"]
          hash["indiceP"] = ncomtarios.to_i/nposts.to_i
    
          @influencers.push(hash)
    
        end
    
    
      end
end
