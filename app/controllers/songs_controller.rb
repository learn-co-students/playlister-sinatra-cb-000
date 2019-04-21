class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.new()
    song.name = params[:song_name]
    song.genres = params[:genres].collect{|id| Genre.find(id)}
    if !artist = Artist.find_by(name: params[:artist_name])
      artist = Artist.new()
      artist.name = params[:artist_name]
    end
    song.artist = artist
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
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

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song_name]
    song.artist.name = params[:artist_name]
    if !params[:genres].empty?
      song.genres = params[:genres].collect{|id| Genre.find(id)}
    else
      song.genres.clear
    end
    song.artist.save
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
