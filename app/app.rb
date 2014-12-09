require 'sinatra'
require 'data_mapper'
require 'bcrypt'

enable :sessions

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/pics.db")

class User 
  include DataMapper::Resource 

  has n, :folders 
  
  property :user_id, Serial 
  property :username, String, :unique => true
  property :password, String
  property :status, Boolean, :default => false
  property :name, String
  property :lastname, String
  property :email, String 
  property :token, BCryptHash, :unique => true, :default => lambda { |r, p| r.username}
end 

class Picture 
  include DataMapper::Resource 

  belongs_to :folder, :required => false

  property :pic_id, Serial 
  property :folder, String 
  property :tag, String
  property :file_path, String
end

class Folder
  include DataMapper::Resource 

  belongs_to :user, :required => false
  has n, :pictures

  property :folder_id, Serial 
  property :name, String 
  property :file_path, String
end 

DataMapper.finalize.auto_upgrade!


get "/link" do
    redirect "/link.html"
end

configure do
    set :token, ''
end

get "/enroll/:token" do
    settings.token = params[:token]
    redirect "/enroll.html?token=#{settings.token}"
end

post "/confirm" do
  user = User.first({:token => settings.token})
  if user.status == true
    return "Account already confirmed"
  else
    user.name     = params[:name]
    user.lastname = params[:lastname]
    user.status   = true
    user.email    = params[:email]  
    user.password = params[:password]

    if user.save
      session[:name] = user.user_id
      redirect "/link.html"
    end
  end
      
end

post '/upload_image' do
    tempfile = params[:file][:tempfile] 
    filename = params[:file][:filename] 
    cp(tempfile.path, "public/uploads/#{filename}")
end

get "/" do
    redirect "/login.html"
end

post '/users' do 
   users = User.new(params[:users])
   users.token = users.token.gsub!("/", "0")

   if users.save
      session[:name] = users.user_id
      redirect "/MainPage.html"
   else
      return "Username already in use"
   end
end 

post '/loguser' do 
  user = User.first({:username => params[:username]})
  
  if user.nil?
    return "User does not exist"
  else
    if user.password == params[:password]
      session[:name] = user.user_id
      redirect "/MainPage.html?#{session[:name]}"
    else
      return "Wrong Password"
    end
  end
end 


