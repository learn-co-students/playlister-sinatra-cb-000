require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash

  get '/songs/new' do
    erb :'/songs/new'
  end 

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    song = Song.create_from_web(params)
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song = Song.update_from_web(@song,params)
    puts @song.inspect
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end