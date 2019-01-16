class ArtistsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  get '/artists' do
    @artists = Artist.all
    erb :artists
  end
end
