require 'pry'
class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre_ids = params[:genre_ids]
    @song.save
    redirect to '/songs/#{@song.slug}'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/view'
  end
end
