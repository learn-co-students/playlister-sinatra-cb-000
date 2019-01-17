class GenresController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  get '/genres' do
    @genres = Genre.all
    erb :'genre/genres'
  end
  get '/genres/:id' do
    @genre = Genre.find_by(id: params[:id])
    erb :'genre/show'
  end
end
