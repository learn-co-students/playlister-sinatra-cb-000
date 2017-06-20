class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.new(name: params[:name])
    if @song.save
      if !params[:genres].empty?
        params[:genres].each do |genre|
          @song.genres << Genre.create(name: genre)
        end
      end
      if !params[:artist_name].empty?
        @artist = Artist.find_by(name: params[:artist_name])
        @song.artist = @artist || Artist.create(name: params[:artist_name])
      end
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = params[:artist_name]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
