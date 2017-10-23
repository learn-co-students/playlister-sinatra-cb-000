class SongsController < ApplicationController

  get '/songs' do
    # Present the user with a list of all songs in the library
    # Each song should be a clickable link to that particular song's show page
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and the genre
    # associated with the song.
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end



end
