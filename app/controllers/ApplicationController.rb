require './config/environment'

class ApplicationController < Sinatra::Base

  #enables sessions
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hidden secret"
  end

  #redirects to index if session is empty
  get "/" do
    if session[:user_id].nil?
      erb :index
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
