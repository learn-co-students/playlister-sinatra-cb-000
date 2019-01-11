class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'songs/index.html'
  end

  get '/songs/:song' do
    @song = Song.find_by_slug(params[:song])

    erb :'songs/show.html'
  end
end
