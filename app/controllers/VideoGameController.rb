class VideoGameController < ApplicationController


  get '/videogames' do
    @videogames = VideoGame.all
    erb :'videogames/index'
  end

  #redirects to the new.erb after being logged in
  #if not redirects back to login page.
  get '/videogames/new' do
    if logged_in?
      erb :'videogames/new'
    else
      redirect '/login'
    end
  end

    #allows the current user to post to the new.erb
  post '/videogames/new' do
    #makes user equal to the current user signed in.
    user = current_user
    if params[:title].empty?
      redirect '/videogames/new'
    else
      user.videogames.create(params)

      redirect '/videogames'
    end
  end

  get 'videogames/:slug/edit' do
    if logged_in?
      @videogame = VideoGame.find_by_slug(params[:slug])

      erb :'/videogames/edit'
    else
      redirect '/login'
    end
  end


  post '/videogames/:slug/edit' do
    videogame = VideoGame.find_by_slug(params[:slug])
    params.delete(:slug)
    videogame.update(params)

    redirect "/videogames/#{videogames.sluggify}"
  end

  get '/videogames/:slug' do
    @videogame = VideoGame.find_by_slug(params[:slug])
    @session = session

    erb :'videogames/show'
  end

  post '/videogames/:slug/delete' do
    videogame = VideoGame.find_by_slug(params[:slug])
    VideoGame.delete(game.id)

    redirect '/videogames'
  end
end
