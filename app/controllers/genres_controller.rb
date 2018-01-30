class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/new' do

  end

  get '/genres/:slug' do
    genre_name = params[:slug].gsub("-"," ")
    @genre = Genre.all.find {|n| genre_name == n.name.downcase }

    erb :'/genres/show'
  end

end
