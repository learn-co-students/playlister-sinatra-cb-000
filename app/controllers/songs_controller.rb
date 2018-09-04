class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do

    new_song = Song.create(name: params[:song_name])

    params[:genres].each do |genre_id|
      new_song.genres << Genre.find_by(id: genre_id)
    end

    artist = Artist.all.find {|o| o.name == params[:artist_name]}

    if !artist
      artist = Artist.create(name: params[:artist_name])
    end

    new_song.artist = artist
    new_song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{new_song.slug}"

  end

  post '/songs/:slug' do

    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.artist = artist

    if !!params[:genres]
      song.genres.clear
      params[:genres].each do |genre_id|
        song.genres << Genre.find_by(id: genre_id)
      end
    end

    song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
