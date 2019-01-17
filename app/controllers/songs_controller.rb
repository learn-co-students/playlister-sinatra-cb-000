class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  get '/songs' do
    @songs = Song.all
    erb :'song/songs'
  end
  get '/songs/new' do
    @genres = Genre.all
    erb :'song/new'
  end
  post '/songs' do
    #binding.pry
    if !!Artist.find_by(name: params[:artist])
      art = Artist.find_by(name: params[:artist])
    else
      art = Artist.create(name: params[:artist])
    end
    tune = Song.create(
    name: params[:name],
    artist_id: art.id ,
    genre_id: params[:genre]
    )
    tune.save
    redirect to :'/songs'
  end

  get '/songs/:id' do
    @song = Song.find_by(id: params[:id])
    erb :'song/show'
  end

end
