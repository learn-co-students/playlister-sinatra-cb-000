class GenreController < ApplicationController

  get '/genres' do
    @all = Genre.all
    erb :'genres/index'   
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    erb :'genres/show'
  end

end