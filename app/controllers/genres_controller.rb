class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:slug' do
    # @songs = Song.all
    # this is tested to work..
    # p Song.all

    # class method.. spelt right, given an arg. arg has contents..
    # but doesnt return anything..
    # find by something else?
    @genre = Genre.find_by_slug(params[:slug])
    # binding.pry


    erb :'/genres/show'
  end
end
