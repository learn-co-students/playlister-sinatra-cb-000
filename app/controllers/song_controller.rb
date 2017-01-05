class SongController < ApplicationController

  get '/songs' do
    #displays a list of songs
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
      erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save
    #if no existing artist, 'songs/:slug'
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    if @song
      erb :'songs/show'
    end
  end
end
