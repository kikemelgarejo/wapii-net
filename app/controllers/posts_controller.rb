class PostsController < ApplicationController
    def index
        posts = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
    
        @postsfiltrados = []
    
        posts.each do |post|
          hash = Hash.new
    
          hash["title"] = post["title"]
          hash["body"] = post["body"]
    
          usuariopost = HTTParty.get('https://jsonplaceholder.typicode.com/users/'+ post["userId"].to_s)
          hash["name"] = usuariopost["name"]
    
          idpost = post["id"].to_s
          comentariosposts = HTTParty.get("https://jsonplaceholder.typicode.com/posts/"+ idpost +"/comments")
          ncomentarios = 0 
          comentariosindex = []
    
          comentariosposts.each do |key, value|
            hascomentario = Hash.new
            hascomentario["comentario"] = key["body"]
            comentariosindex.push(hascomentario)
          end
    
          comentariosposts.each do |count|
            ncomentarios += 1
          end
    
          hash["total"] = ncomentarios.to_s
          hash["comentarios"] = comentariosindex
    
          @postsfiltrados.push(hash)
    
    
        end
        
    end
end
