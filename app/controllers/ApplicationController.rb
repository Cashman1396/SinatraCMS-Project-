require './config/environment'

class ApplicationController < Sinatra::Base

  #enables sessions
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super secret"
  end

  #this block for making sure the controller is working properly in shotgun. this will be commented out
  #get '/home' do
    #"Hello World"
  #end

  #redirects to index if session is empty
  get "/" do
    if session[:user_id].nil?
      erb :index
    else
        redirect '/home'
      end
  end


  #helpers added to find current user and session
  helpers do
      def logged_in?
        !!session[:user_id]
      end

    def current_user
      User.find(session[:user_id])
    end
  end
end
