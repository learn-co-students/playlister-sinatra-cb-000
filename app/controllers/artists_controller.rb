class ArtistController < ApplicationController
  get '/artists' do
    @artists = Artist.all

    slim :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

    slim :'artists/show'
  end
end
