require 'rack-flash'

class SongController < ApplicationController
  enable :sessions
  use Rack::Flash
  get '/songs' do
    #displays a list of songs
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
      erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    #if no existing artist, 'songs/:slug'
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end



  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song
      erb :'songs/show'
    end
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
