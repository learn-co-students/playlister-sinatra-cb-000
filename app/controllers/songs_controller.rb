class SongsController < ApplicationController

  # Read get: Index page
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # Read get: New song page
  get '/songs/new' do
    #@genres = Genre.all.sort_by { |genre| genre.name }
    @genres = Genre.all.sort_by do |genre|
      genre.name
    end
    #@artists = Artist.all.sort_by { |artist| artist.name }
    @artists = Artist.all.sort_by do |artist|
      artist.name
    end

    erb :'/songs/new'
  end

  # Post: Create song
  post '/songs' do
    #binding.pry
    if !Song.find_by(name: params[:song][:name])
      song = Song.create(params[:song])

      if !params[:artist][:name].empty?
        # update song.artist to value as input by user
        song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      end

      if !params[:genre][:name].empty?
        # song.genres as input by user must be a new genre
        if Genre.find_by(name: params[:genre][:name])
          flash[:message] = "Genre already exists, please select from checklist"
        else
          song.genres << Genre.create(name: params[:genre][:name])
        end
      end

      song.save

      # Flash Message when a new song is created
      flash[:message] = "Successfully created song."
    else
      # Flash Message when the new song already exists
      flash[:message] = "Song already exists."
    end

    redirect :"/songs/#{song.slug}"
  end

  # Read: Show song's detail page
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  # Read: Edit a song
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    @genres = Genre.all.sort_by do |genre|
      genre.name
    end

    @artists = Artist.all.sort_by do |artist|
      artist.name
    end

    erb :'/songs/edit'
  end

  # Patch: Update song
  patch '/songs/:slug' do
    #binding.pry
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])

    if !params[:artist][:name].empty?
      # song.artist as input by user
      song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end

    if !params[:genre][:name].empty?
      # song.genres as input by user must be a new genre
      if Genre.find_by(name: params[:genre][:name])
        flash[:message] = "Genre already exists, please select from checklist"
      else
        song.genres << Genre.create(name: params[:genre][:name])
      end
    end

    song.save

    # Flash Message when the object is updated
    flash[:message] = "Successfully updated song."

    redirect :"/songs/#{song.slug}"
  end

end
