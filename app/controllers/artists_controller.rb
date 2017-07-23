class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    puts "***** There are #{@artists.size} artists loaded!"

    erb :'/artists/index'
  end

  get '/artists/new' do

  end

  get '/artists/:slug' do
    #@song = Song.find_by_id( params[:id] )
    @artist = Artist.find_by_slug( params[:slug] )
    erb :'artists/show'
  end

  get '/artists/:slug/edit' do

  end

end
