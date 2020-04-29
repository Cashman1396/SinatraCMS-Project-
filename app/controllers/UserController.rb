class UserController < ApplicationController

  get '/home' do
    if logged_in?
      @user = current_user
    else
      redirect '/'
    end
    erb :'user/index'
  end

  get '/signup' do
    erb :'user/signup'
  end


  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id

    if user.save
      redirect '/home'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'user/login'
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
