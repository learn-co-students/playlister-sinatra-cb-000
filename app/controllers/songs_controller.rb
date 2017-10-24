require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    # Present the user with a list of all songs in the library
    # Each song should be a clickable link to that particular song's show page
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    # binding.pry
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params[:Name], artist: artist)
    if !params[:genres].empty?
      params[:genres].each do |genre|
        @song.genres <<  Genre.find_by_id(genre.to_i)
          # params[:genres].first.to_i)
        # g = Genre.find_or_create_by(name: genre)
      # @song.genres << params[:genres]
      end
    end

    @song.save
    flash[:message] = "Successfully created song."
    # binding.pry

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and the genre
    # associated with the song.
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
     @artist = Artist.find_or_create_by(name: params["Artist Name"])
     @song.update(name: params["Name"], artist: @artist)
     if !params[:genres].empty?
       params[:genres].each do |genre|
         @song.genres <<  Genre.find_by_id(genre.to_i)
       end
     end
     @song.save
     flash[:message] = "Successfully updated song."
     redirect to "/songs/#{@song.slug}"

   end
  end
