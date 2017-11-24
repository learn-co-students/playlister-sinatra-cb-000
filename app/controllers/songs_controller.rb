require 'rack-flash' 

class SongsController < ApplicationController  
    use Rack::Flash 
    use Rack::MethodOverride
    include Helpers::InstanceMethods
    extend Helpers::ClassMethods

    get "/songs" do
        @songs = Song.all
        erb :"songs/songs"
    end

    get "/songs/new" do
        erb :"songs/new"
    end

    post "/songs" do
        if !Song.find_by(params[:song])
            song = Song.create(params[:song])
            if !Artist.find_by(params[:artist])
                artist = Artist.create(params[:artist]) 
            else
                artist = Artist.find_by(params[:artist])
            end
            params[:genre].each do |genre_hash|
                genre = Genre.create(genre_hash)
                song.genres << genre
            end
            artist.songs << song
            flash[:message] = "Successfully created song."
        else
            song = Song.find_by(params[:song])
            flash[:message] = "Song already exists."
        end
        redirect "/songs/#{song.slug}"
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/edit"
    end

    patch "/songs/:slug" do
        song = Song.find(params[:id])
        song.update(params[:song])

        if !Artist.find_by(params[:artist])
            artist = Artist.create(params[:artist]) 
        else
            artist = Artist.find_by(params[:artist])
        end
        song.artist = artist
        
        song.genres.clear
        params[:genre].each do |genre_hash|
            genre = Genre.create(genre_hash)
            song.genres << genre
        end

        artist.save
        song.save

        flash[:message] = "Successfully updated song."
        redirect "/songs/#{song.slug}"
    end
end