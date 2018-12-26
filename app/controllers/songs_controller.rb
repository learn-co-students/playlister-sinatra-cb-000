class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist_name])
    genre = Genre.find_or_create_by(name: params[:genres])
    @song = Song.new(name: params[:name])
    @song.artist = artist
    params[:genres].each do |g|
      @song.genres << Genre.find_or_create_by(name: g)
    end
    @song.save
    binding.pry
    session[:song_message] = "Successfully created song."

    redirect "songs/#{@song.slug}"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end




end
