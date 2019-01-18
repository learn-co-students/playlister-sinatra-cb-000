class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'songs/index.html'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'songs/new.html'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show.html'
  end

  post '/songs/' do
    @song = Song.create(name: params[:song_name])
    @song.update(artist: Artist.find_or_create_by(name: params[:artist_name]))
    @song.update(genre_ids: params[:genres])

    session[:create] = true

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit.html'
  end

  patch '/songs/:id/edit' do
    @song = Song.find(params[:id])
    @song.update(params[:song])
    @song.update(artist: Artist.find_or_create_by(params[:artist]))
    @song.update(genre_ids: params[:genres])

    session[:update] = true

    redirect to "/songs/#{@song.slug}"
  end

  helpers do
    def updated?
      !!session[:update]
    end

    def created?
      !!session[:create]
    end
  end

end
