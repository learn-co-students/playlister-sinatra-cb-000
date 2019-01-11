class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all

    erb :'genres/index.html'
  end

  get '/genres/:genre' do
    @genre = Genre.find_by_slug(params[:genre])
    
    erb :'genres/show.html'
  end
end
