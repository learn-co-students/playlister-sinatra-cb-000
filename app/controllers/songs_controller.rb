require 'rack-flash'


class SongController < ApplicationController
  use Rack::Flash

  enable :sessions

  get "/songs" do
   erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: @artist)

    params["genres"].each do  |id|
      @song.genres.push Genre.find(id.to_i)
    end
    @song.save
    flash[:success] = "Successfully created song."


    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find(params["id"])
    @song.name = params["Name"]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    params["genres"].each do  |id|
      @song.genres.push Genre.find(id.to_i)
    end
    @song.save
    flash[:success] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end
