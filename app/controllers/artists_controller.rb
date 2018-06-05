class ArtistsController < ApplicationController

  # Read get: Index page
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  # Read get: New Artist page
  get '/artists/new' do
    erb :'/artists/new'
  end

  # Read: Show artist's detail page
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

end
