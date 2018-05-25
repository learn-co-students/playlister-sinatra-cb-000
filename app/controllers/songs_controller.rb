require 'pry'
class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/' do
    binding.pry
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    params[:song][:genres].each{|genre_name| @song.genres << Genre.find_or_create_by(name: genre_name)}
    @song.save
    redirect to '/songs/#{@song.slug}'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/view'
  end
end
