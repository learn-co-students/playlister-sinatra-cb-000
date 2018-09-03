class SongsController < ApplicationController

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    artist_name = params[:artist_name]
    new_song = Song.create(name: params[:song_name])
    new_song_genre = SongGenre.create(song_id: new_song.id, genre_id: params[:genres][0])

    artist = Artist.all.find {|o| o.name == artist_name}

    if !artist
      artist = Artist.create(name: artist_name)
    end

    new_song.artist = artist
    new_song.save
    binding.pry
    redirect "/songs/#{new_song.slug}"

  end

end
