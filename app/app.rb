require 'sinatra'
require 'rubygems'
require 'data_mapper'
require 'bcrypt'
require 'fileutils'

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
  property :tag, String
  property :file_path, Text
end

class Folder
  include DataMapper::Resource 

  belongs_to :user, :required => false
  has n, :pictures

  property :folder_id, Serial 
  property :name, String
  property :description, String
end 

DataMapper.finalize.auto_upgrade!

get "/confirm" do
  redirect "/confirm.html"
end

post "/confirm.html" do
end

get "/enroll" do
  redirect "/enroll.html"
end

get "/link" do
  redirect "/link.html"
end

post "/link.html" do

end
#get "/folder_list" do
#redirect "/folder_list.html"
#end
#post "/folder_list.html" do
#end

configure do
    set :token, ''
    set :username, ''
end

get "/enroll/:token" do
    settings.token = params[:token]
    redirect "/enroll.html?token=#{settings.token}"
end

get "/folder_list" do
    user = User.first({:user_id => session[:name]})
    @folders =  user.folders.all()
    erb :folder_list
end

get "/MainPage" do
    erb :MainPage
end

get "/logout" do
    session[:name] = ''
    redirect "/login.html"
end

get "/upload_image" do
    user = User.first({:user_id => session[:name]})
    @folders =  user.folders.all()
    erb :upload_image
end

get "/upload_to_folder/:folder_id" do
    @folder = Folder.first({:folder_id => params[:folder_id]})
    erb :upload_to_folder
end

get "/folder_images/:folder_id" do
    @folder = Folder.first({:folder_id => params[:folder_id]})
    erb :folder_images
end

get "/search_by_tag" do
    erb :search_by_tag
end

get "/tag_images/:tag" do
    user = User.first({:user_id => session[:name]})
    @pics = user.folders.pictures.all(:fields => [:file_path], :tag => params[:tag])
    erb :tag_images
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

post '/upload_to_folder/:folder_id' do
    folder = Folder.first({:folder_id => params[:folder_id]})
    user   = User.first({:user_id => session[:name]})
    folder.pictures.new(:file_path => params[:file][:filename], :tag => params[:tag])

    filename = params[:file][:filename]
    tempfile = params[:file][:tempfile]  
    
    if user.status == false 
       if folder.pictures.count > 1
          return "Please confirm your account to continue"
       end
    end

    FileUtils::mkdir_p("./public/uploads/#{session[:name]}")
    File.open("./public/uploads/#{session[:name]}/#{filename}", 'wb') do |f|
      f.write(tempfile.read)
    end

    if folder.save
      redirect "folder_images/#{params[:folder_id]}"
    else
      return "Failed to upload the image"
    end

end

post '/upload' do
    folder = Folder.first({:folder_id => params[:folder]})
    user   = User.first({:user_id => session[:name]})
    folder.pictures.new(:file_path => params[:file][:filename], :tag => params[:tag])

    filename = params[:file][:filename]
    tempfile = params[:file][:tempfile]  
    
    if user.status == false 
       if folder.pictures.count > 1
          return "Please confirm your account to continue"
       end
    end

    FileUtils::mkdir_p("./public/uploads/#{session[:name]}")
    File.open("./public/uploads/#{session[:name]}/#{filename}", 'wb') do |f|
      f.write(tempfile.read)
    end

    if folder.save
      redirect "folder_images/#{params[:folder]}"
    else
      return "Failed to upload the image"
    end

end

post '/add_folder' do
    user = User.first({:user_id => session[:name]})

    user.folders.new(:name => params[:name], :description => params[:description])

    if user.status == false 
       if user.folders.count > 1
          return "Please confirm your account to continue"
       end
    end

    if user.save
      redirect "createfolder.html"
    else
      return "Failed to add folder"
    end
end

get "/" do
    redirect "/login.html"
end

post '/users' do 
   users = User.new(params[:users])
   users.token = users.token.gsub!("/", "0")

   if users.save
      settings.username = users.name
      session[:name] = users.user_id
      erb :MainPage
   else
      return "Username already in use"
   end
end 

post '/loguser' do 
  user = User.first({:username => params[:username]})
  if user.nil?
    return "User does not exist"
  else
    settings.username = user.name
    if user.password == params[:password]
      session[:name] = user.user_id
      erb :MainPage
    else
      return "Wrong Password"
    end
  end
end

post '/search_tag' do
    redirect "tag_images/#{params[:tag]}"
end


