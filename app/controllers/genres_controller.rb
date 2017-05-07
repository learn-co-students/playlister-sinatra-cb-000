class Genres_controller < ApplicationController
  get '/genres' do
    @genres = Genre.all

    slim :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    slim :'genres/show'
  end
end
