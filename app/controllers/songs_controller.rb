class SongsController < ApplicationController
    
    get '/songs' do
      @songs = Song.all
      erb :'/songs/index'
    end

    get '/songs/new' do
      erb :'/songs/new'
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    end

    patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])

      @artist = Artist.create(name: params["Artist Name"])

      @song.artist = @artist
      @song.save

      redirect "/songs/#{@song.slug}"
    end

    post '/songs' do
      @song = Song.create(name: params["Name"])
      
      params["Genre"].each do |genre|
        @song.genres << Genre.find_by(name: genre)
      end

      @song.save
      if @artist = Artist.find_by(name: params["Artist Name"])
        @artist
      else
        @artist = Artist.create(name: params["Artist Name"])
      end

      @artist.songs << @song
      redirect "/songs/#{@song.slug}"
    end
end