class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    puts "***** There are #{@genres.size} genres loaded!"
    puts @genres.name
    erb :'/genres/index'
  end

  get '/genres/new' do

  end

  get '/genres/:slug' do
    #@song = Song.find_by_id( params[:id] )
    @genre = Genre.find_by_slug( params[:slug] )
    erb :'genres/show'
  end

  get '/genres/:slug/edit' do

  end

end
