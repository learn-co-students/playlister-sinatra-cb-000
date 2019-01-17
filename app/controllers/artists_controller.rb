class ArtistsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  get '/artists' do
    @artists = Artist.all
    erb :'artist/artists'
  end


  get '/artists/:slug' do
    @artist = Artist.find_by(name: deslugify(params[:slug]))
    erb :'artist/show'
  end
end
