class GameController < ApplicationController

  get '/games' do
    @games = Game.all

    erb :'games/index'
  end 
