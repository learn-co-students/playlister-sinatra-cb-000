class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    
    erb :"songs/index"
  end
  
  
  get '/songs/:slug' do
    
    # user params[:slug] within the
    # find_by_slug function
    
    erb :"/songs/show"
  end
  
end