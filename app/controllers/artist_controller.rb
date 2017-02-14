require 'rack-flash'

class ArtistController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/new' do
    erb :'artists/new'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  post '/artists' do
    artist = Artist.create(params[:artist])
    redirect "/artists/#{artist.slug}"
  end

end
