class ArtistController < ApplicationController
  get '/artists' do
    erb :'artists/index'
  end
end
