class UsersController < ApplicationController

    get '/' do
    erb :index
  end

  get '/signup' do
    if !session[:id].nil?
      redirect '/tweets'
    end

    erb :'users/signup'
  end

   post '/signup' do
   user = User.create(username: params[:username], email: params[:email], password: params[:password])

   if user.valid?
     session[:id] = user.id
     redirect '/tweets'
   else
     redirect '/signup'
   end
  end

 get '/login' do
   if !session[:id].nil?
     redirect '/tweets'
   end

   erb :'users/login'
 end

 post '/login' do
   user = User.find_by(username: params[:username])

   if user && user.valid?
     user.authenticate(params[:password])
     session[:id] = user.id
     redirect '/tweets'
   else
     redirect '/login'
   end
  end

   get '/logout' do
     session.clear
     redirect '/login'
   end

   get '/users/:username' do
     @user = User.find_by username: params[:username]

     erb :'users/show'
   end
 end
















# class UsersController < ApplicationController

# #use Rack::Flash
 
    
#     get "/signup" do
#       erb :'/users/create_user'
#     end
    
#     post "/signup" do
#     end
    
#     get "/login" do
#       erb :'/users/login'
#     end
    
#     post "/login" do
#       user = User.find_by(username: params["username"], password: params["password"])
#     if user
#       session[:user_id] = user.id
#       redirect to '/tweets'
#     else
#       erb :login
#     end

#     end
    
#     get "/logout" do
#       session.clear
#       redirect to "/users/login"
#     end
    
#   # post "/signup" do
#     #end
    
# end
