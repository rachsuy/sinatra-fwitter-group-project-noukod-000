require './config/environment'

class ApplicationController < Sinatra::Base
  #register Sinatra::ActiveRecordExtension
  #set :session_secret, "my_application_secret"
  configure do
    set :public_folder, 'public'
   # set :views, 'app/views'
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  
   get '/index' do
      erb :index
    end 
end



  #set :views, Proc.new { File.join(root, "../views/") }