require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    # Present the user with a list of all songs in the library
    # Each song should be a clickable link to that particular song's show page
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    binding.pry
    artist = Artist.find_or_create_by(name: "cher")
    @song = Song.create(name: params[:name], artist: artist)
    if !params[:genres].empty?
      @song.genres << params[:genres]
    end

    @song.save

  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and the genre
    # associated with the song.
    # @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end



end
