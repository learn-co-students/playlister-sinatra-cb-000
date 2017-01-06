class SongsController < ApplicationController
  extend Concerns::Namespaceable::ClassMethods
  contoller_name = self.controller_name
  self.set_configs

  namespace "/#{controller_name}" do
    get '' do
      @songs = Song.all
      erb :index
    end

    get '/new' do
      @song = Song.new
      erb :new
    end

    get '/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :edit
    end

    get '/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @artist = @song.artist
      erb :show
    end

    post '' do
      @song = Song.create(name: params[:Name])
      artist = Artist.find_or_create_by(name: params[:'Artist Name'])
      @song.artist = artist
      params[:genres].each do |gid|
        @song.genres << Genre.find(gid)
      end
      if @song.save
        flash[:message] = "Successfully created song."
      end

      redirect to "/songs/#{@song.slug}"
    end

    patch '/:slug' do
      song = Song.find_by_slug(params[:slug])
      song.name = params[:Name]
      artist = Artist.find_or_create_by(name: params[:'Artist Name'])
      song.artist = artist
      song.genres.clear
      params[:genres].each do |gid|
        song.genres << Genre.find(gid)
      end
      if song.save
        flash[:message] = "Successfully updated song."
      end
      redirect to "/songs/#{song.slug}"
    end



  end
end
