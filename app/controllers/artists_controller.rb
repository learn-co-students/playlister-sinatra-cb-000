class ArtistsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  get '/artists' do
    @artists = Artist.all
    erb :'artist/artists'
  end


  get '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    erb :'artist/show'
  end
end
