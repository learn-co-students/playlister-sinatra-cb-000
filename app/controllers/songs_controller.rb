class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do
    artist = Artist.find_by(name: params[:artist])
    if !artist
      artist = Artist.new(name: params[:artist])
    end
    song = artist.songs.build(params[:song])
    artist.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    if song.artist.name != params[:artist]
      artist = Artist.find_by(name: params[:artist])
      if !artist
        artist = Artist.new(name: params[:artist])
        artist.save
      end
      song.artist = artist
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
