require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.create_from_web(params[:song_name],params[:artist_name],params[:genres])
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs' do
    @all = Song.all
    erb :'songs/index'   
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.update_from_web(params[:slug],params[:artist_name],params[:genres])
    flash[:message] = "Successfully updated song."    
    redirect to "/songs/#{params[:slug]}"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end

