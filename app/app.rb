require 'sinatra'
require 'data_mapper'
require 'bcrypt'

enable :sessions

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/pics.db")

class User 
  include DataMapper::Resource 
  property :user_id, Serial 
  property :username, String, :unique => true
  property :password, String
  property :status, Boolean, :default => false
  property :fullname, String
  property :email, String 
  property :token, BCryptHash, :unique => true, :default => lambda { |r, p| r.username}
  has n, :pictures
  has n, :folders
end 

class Picture 
  include DataMapper::Resource 
  property :pic_id, Serial 
  property :folder, String 
  property :tag, String
  property :file_path, String
  belongs_to :user
  #belongs_to :folder
end

class Folder
  include DataMapper::Resource 
  property :folder_id, Serial 
  property :name, String 
  property :file_path, String
  belongs_to :user
  has n, :pictures
end 

DataMapper.finalize.auto_upgrade!


get "/link" do
    redirect "/link.html"
end

get "/enroll/:token" do
    redirect "/enroll.html&token=#{params['token']}"
end

post "/enroll.html" do
    
end

post '/upload_image' do
    tempfile = params[:file][:tempfile] 
    filename = params[:file][:filename] 
    cp(tempfile.path, "public/uploads/#{filename}")
end

get "/" do
    redirect "/signin.html"
end

get "/login.html" do
    redirect "/login.html"
end

get "/MainPage.html/" do
    redirect ""
end


post '/users' do 
   users = User.new(params[:users])

   if users.save
      session[:name] = users.user_id
      redirect "/MainPage.html"
   else
      return "Username already in use"
   end
end 


