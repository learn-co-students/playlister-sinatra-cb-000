class GenresController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  get '/genres' do
    @genres = Genre.all
    erb :'genre/genres'
  end
  get '/genres/:slug' do
    @genre = Genre.find_by(name: deslugify(params[:slug]))
    erb :'genre/show'
  end
end
