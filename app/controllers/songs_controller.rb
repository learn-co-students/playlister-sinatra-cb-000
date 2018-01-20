class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    song = Song.find_or_create_by(name: params[:song_name])
    if Artist.find_by(name: params[:artist_name])
      song.artist = Artist.find_by(name: params[:artist_name])
    else
       song.artist = Artist.create(name: params[:artist_name])
     end
    params[:genres].each do |genre|
      song.genres << Genre.find_or_create_by(name: genre)
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    song = Song.find(params[:id])
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    song.genres = []
    params[:genres].each do |genre|
      song.genres << Genre.find_or_create_by(name: genre)
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
