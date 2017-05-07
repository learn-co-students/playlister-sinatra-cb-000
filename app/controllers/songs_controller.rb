class SongsController < ApplicationController
  use Rack::Flash

  # create

  get '/songs/new' do
    @genres = Genre.all

    slim :'songs/new'
  end

  post '/songs' do
    song = Song.new(params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  # read
  get '/songs' do
    @songs = Song.all

    slim :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    slim :'songs/show'
  end

  # update

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    slim :'songs/edit'
  end



  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.update(params[:song], artist: artist)

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
end
