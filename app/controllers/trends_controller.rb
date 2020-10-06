class TrendsController < ApplicationController
    def index
        @postordenados = []


        posts = HTTParty.get('https://jsonplaceholder.typicode.com/posts')


        posts.each do |post|

        idpost = post["id"].to_s
            
        hash = Hash.new
        user = HTTParty.get('https://jsonplaceholder.typicode.com/users/'+ post["userId"].to_s)
        comentariosposts = HTTParty.get("https://jsonplaceholder.typicode.com/posts/"+ idpost +"/comments")

        ncomtarios = 0 
        comentariosposts.each do |count|
            ncomtarios += 1
        end
     
        
        iduser = user["id"].to_s
        
        hash["name"] = user["name"]
        hash["title"] = post["title"]
        hash["body"] = post["body"]
        hash["total"] = ncomtarios.to_s

        @postordenados.push(hash)
        end
    end
end
