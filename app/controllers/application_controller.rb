class ApplicationController < Sinatra::Base

 use Rack::Flash
 enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }



 get '/songs' do
   @songs = Song.all
   erb :'/songs/index'

 end

 get '/songs/new'do

   erb :'/songs/new'
 end

get '/songs/:slug/edit'do
  @song = Song.find_by_slug(params[:slug])
  erb :'/songs/edit'
end

 get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
 end

 patch '/songs/:slug'do

   @song = Song.find_by_slug(params[:slug])

   @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name]) unless params[:song][:artist_name] == ""

   @song.genres.clear

   params[:genres].each do |genre|
     genre_to_add = Genre.find_by_id(genre)
     @song.genres << genre_to_add
   end

   @song.save
  flash[:message] = "Successfully updated song."
   redirect to"/songs/#{@song.slug}"
 end



 post '/songs' do

     song_name = params[:song][:song_name]
     @song = Song.create(name: song_name)
     artist_name = params[:song][:artist_name]


        artist = Artist.find_by(name: artist_name) || artist_name
      if artist.class == Artist

       @song.artist = artist
     else
      @song.build_artist(name: artist)
     end

     params[:genres].each do |genre|
       genre_to_add = Genre.find_by_id(genre.to_i)
       @song.genres << genre_to_add
     end
     @song.save

      flash[:message] = "Successfully created song."

     redirect to "/songs/#{@song.slug}"
end
##################################################
 get '/artists' do
   @artists = Artist.all
   erb :'/artists/index'
 end

 get '/artists/:slug' do
   @artist = Artist.find_by_slug(params[:slug])
   erb :'/artists/show'
 end

##################################################
 get '/genres' do
   @genres = Genre.all
   erb :'/genres/index'
 end

 get '/genres/:slug' do

  @genre = Genre.find_by_slug(params[:slug])
   erb :'/genres/show'
end


  end
