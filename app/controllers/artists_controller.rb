class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/new' do

  end

  get '/artists/:slug' do
    slug = params[:slug].gsub("-"," ")
    @artist = Artist.all.find {|n| slug == n.name.downcase }

    erb :'/artists/show'
  end

  get '/artists/songs/:slug' do
    redirect "/songs/#{params[:slug]}"
  end

  get '/artists/genres/:slug' do
    redirect "/genres/#{params[:slug]}"
  end
end
