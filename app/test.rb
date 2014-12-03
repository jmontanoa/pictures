require 'sinatra'
require 'sinatra/respond_to'
require 'active_record'
require 'json'  

Sinatra::Application.register Sinatra::RespondTo   

#Get the Token of the DB in order to compare this token with the token sent to user
get "/user/:token" do |token|
	format_response MyApI.getToken(token)
end



class MyAPI < ActiveRecord::Base
	@user_id = 0
	
	#class << self  
	ActiveRecord::Base.establish_connection(
		:adapter  => "sqlite", 
		:database => "sqlite3://#{Dir.pwd}/pics.db"
		) 

		# GET   
		def getToken(user_id)    
			query = "SELECT token FROM users WHERE id = #{user_id}"   
			data = self.connection.select_all(query)    
			data[0]["token"]   
		end 

		def format_response (package)  
			respond_to do |request|   
			request.json { package.to_json }  
		end
	#end
end