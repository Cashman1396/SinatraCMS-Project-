class UserController < ApplicationController

  get '/home' do
     if logged_in?
       @user = current_user
     else
       redirect '/'
     end
     erb :'users/index'
   end

#redirets to the signup page
  get '/signup' do
    erb :'users/signup'
  end

#gets the HTTP verb of post when signing up
  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id

#saves user information
    if params[:email].empty? || params[:username].empty?
      redirect '/signup'
    else
      redirect '/home'
    end
  end


  get '/login' do
    erb :'users/login'
  end

  #this creates the secure password by using the has_secure_password line in the model user.
  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect '/home'
    else
      redirect '/login'
    end
  end

  post '/logout' do
    session.clear

    redirect '/'
  end
end
