require 'rack-flash'

class SongsController < ApplicationController

    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :"/songs/index"
    end

    get '/songs/new' do

        erb :"/songs/new"
    end

    post '/songs' do
        @artist = Artist.find_or_create_by(name: params[:artist])
        @song = Song.create(name: params[:name])
        @song.artist = @artist
        params[:genres].each do |genre|
            @song.genres.push(Genre.find(genre))
        end
        # omg @songs.genre_ids = params[:genres] so much cleaner
        @song.save
        flash[:message] = "Successfully created song."
        redirect :"/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"/songs/show"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :"/songs/edit"
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(name: params[:artist])
        @song.update(name: params[:name], artist: @artist)
        @song.genres = []
        params[:genres].each do |genre|
            @song.genres.push(Genre.find(genre))
        end
        # omg @songs.genre_ids = params[:genres] so much cleaner
        @song.save
        flash[:message] = "Successfully updated song."
        redirect :"/songs/#{@song.slug}"
    end

end