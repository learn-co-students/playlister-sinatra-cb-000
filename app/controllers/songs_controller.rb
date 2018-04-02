class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all
    # @landmarks = Landmark.all

    erb :'/songs/new'
  end

  post '/songs' do

# @figure = Figure.create(params[:figure])
# #
# #
# if !params["title"]["name"].empty?
#   @figure.titles << Title.create(name: params["title"]["name"])
# end
# if !params["landmark"]["name"].empty?
#   @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
# end
#
# @title.save
# redirect "owners/#{@owner.id}"
end

  get '/songs/:slug' do
    # @songs = Song.all
    # this is tested to work..
    # p Song.all

    # class method.. spelt right, given an arg. arg has contents..
    # but doesnt return anything..
    # find by something else?
    @song = Song.find_by_slug(params[:slug])
    # binding.pry


    erb :'/songs/show'
  end


end
