require 'rack-flash'
require "rack/flash/test"

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params["artist_name"])
    @song = Song.create(name: params["Name"], artist: artist)
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song_name = params[:slug].gsub("-"," ")
    @song = Song.all.find {|n| @song_name == n.name.downcase }

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    #@song_name = params[:slug].gsub("-"," ")
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    artist = Artist.find_or_create_by(name: params["name"])
    @song = Song.find_by_slug(params[:slug])
    @song.artist = artist
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

end
