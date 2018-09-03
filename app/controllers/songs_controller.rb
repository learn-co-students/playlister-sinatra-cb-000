require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end
  
  get '/songs/new' do
    erb :"songs/new"
  end
  
  get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :"songs/show"
  end
  
  
  post '/songs' do 
    @song_name = params[:song_name]
    @genre_ids = params[:genres]
    @artist_name = params[:artist_name]
    
    @song = Song.create(:name => @song_name)
    
    @song.genre_ids = @genre_ids
    
    @artist = Artist.find_or_create_by(:name => @artist_name)
    
    @song.artist = @artist
    
    @song.save
    flash[:message] = "Successfully created song."
    
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])
  erb :"songs/edit"
  end
  
  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song_name = params[:song_name]
    @genre_ids = params[:genres]
    @artist_name = params[:artist_name]
    @song.name = @song_name
    @song.genre_ids = @genre_ids
    @artist = Artist.find_or_create_by(:name => @artist_name)
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
  
end
