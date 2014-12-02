require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/pics.db")

class Users 
  include DataMapper::Resource 
  property :id, Serial 
  property :username, String 
  property :password, String
  property :status, Boolean
  property :fullname, String
  property :email, String 
  property :token, String
end





DataMapper.finalize.auto_upgrade!


get "/link" do
    redirect "/link.html"
end

get "/enroll" do

    redirect "/enroll.html"
end

post "/enroll.html" do

end
get "/" do
    redirect "/signin.html"
end

get "/login.html" do
    redirect "/login.html"
end

get "/MainPage.html" do
    redirect "/MainPage.html"
end


post '/users' do 
   users = Users.new(params[:users]) 
   users.token='ABCD123'
   #user.status=False
    
   if users.save
   	  return  "Welcome to PICs, Please confirm your account to have full access" 
   end
end 


