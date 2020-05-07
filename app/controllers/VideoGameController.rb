class VideoGameController < ApplicationController


  get '/videogames' do
    @games = Game.all
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
      user.games.create(params)

      redirect '/videogames'
    end
  end

  get '/videogames/:slug/edit' do
    if logged_in?
      @game = Game.find_by_slug(params[:slug])

      erb :'/videogames/edit'
    else
      redirect '/login'
    end
  end

  #use patch or put
  post '/videogames/:slug/edit' do
    videogame = VideoGame.find_by_slug(params[:slug])
    params.delete(:slug)
    videogame.update(params)

    redirect "/videogames/#{videogames.sluggify}"
  end

  get '/videogames/:slug' do
    @game = Game.find_by_slug(params[:slug])
    @session = session

    erb :'videogames/show'
  end

#use delete verb
  post '/videogames/:slug/delete' do
    game = Game.find_by_slug(params[:slug])
    Game.delete(game.id)

    redirect '/videogames'
  end
end
