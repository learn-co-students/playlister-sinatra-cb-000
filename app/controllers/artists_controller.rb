class ArtistsController < ApplicationController

  get '/' do
    erb :index
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end



end
