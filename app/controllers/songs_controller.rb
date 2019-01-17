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
    if !!Artist.find_by(name: params[:artist])
      art = Artist.find_by(name: params[:artist])
    else
      art = Artist.create(name: params[:artist])
    end
    #puts params
    tune = Song.create(
    name: params[:name],
    artist_id: art.id
    )
    tune.save
    params[:genre].each do |genre|
      SongGenre.create(song_id: tune.id, genre_id: genre)
    end
    binding.pry
    redirect to :'/songs'
  end

  get '/songs/:slug' do
    #puts params
    @song = Song.find_by(name: deslugify(params[:slug]))
    erb :'song/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by(name: deslugify(params[:slug]))
    erb :'song/edit'
  end
  post '/songs/:slug' do
    tune = Song.find_by(name: deslugify(params[:slug]))
    if !!Artist.find_by(name: params[:artist])
      art = Artist.find_by(name: params[:artist])
    else
      art = Artist.create(name: params[:artist])
    end
    tune.artist_id = art.id
    tune.name = params[:name]
    tune.song_genres.each do |song_genre|
      song_genre.destroy
    end
    params[:genre].each do |genre|
      SongGenre.create(song_id: tune.id, genre_id: genre)
    end
    tune.save
    @song = tune
    erb :'song/show'
  end
end
