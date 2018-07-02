class GenresController < ApplicationController

  # Read get: Index page
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  # Read get: New genre page
  get '/genres/new' do
    erb :'/genres/new'
  end

  # Read: Show genre's detail page
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

end
