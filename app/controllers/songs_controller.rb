
require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    #puts "***** There are #{@songs.size} songs loaded!"

    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #@song = Song.find_by_id( params[:id] )
    @song = Song.find_by_slug( params[:slug] )
    erb :'songs/show'
  end

  post '/songs' do
      @song = Song.create( name: params["Name"] )
      @song.artist = Artist.find_or_create_by( name: params["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save

      #puts "Successfully created song."
      flash[:message] = "Successfully created song."

      #puts "******6 /songs/#{@song.slug}"
      redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug( params[:slug] )

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song.name = params["Name"]
    @song.artist = Artist.find_or_create_by( name: params["Artist Name"])
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
