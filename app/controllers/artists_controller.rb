class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all

    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # @songs = Song.all
    # this is tested to work..
    # p Song.all

    # class method.. spelt right, given an arg. arg has contents..
    # but doesnt return anything..
    # find by something else?
    @artist = Artist.find_by_slug(params[:slug])
    # binding.pry


    erb :'/artists/show'
  end
end
