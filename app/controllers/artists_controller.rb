class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

  get '/artists/:artist' do
    @artist = Artist.find_by_slug(params[:artist])

    erb :'artists/show.html'
  end
end
