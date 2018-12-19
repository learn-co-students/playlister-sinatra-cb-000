class GenresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end



end
