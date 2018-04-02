class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/:slug' do
    # @songs = Song.all
    # this is tested to work..
    # p Song.all

    # class method.. spelt right, given an arg. arg has contents..
    # but doesnt return anything..
    # find by something else?
    @song = Song.find_by_slug(params[:slug])
    # binding.pry


    erb :'/songs/show'
  end
end
