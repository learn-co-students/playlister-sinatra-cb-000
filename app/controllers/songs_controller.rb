class SongsController < ApplicationController
  get '/songs' do
    # @figures = Figure.all
    erb :'/songs/index'
  end
end
