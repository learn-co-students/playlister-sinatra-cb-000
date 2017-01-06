class ArtistsController < ApplicationController
  extend Concerns::Namespaceable::ClassMethods
  contoller_name = self.controller_name
  self.set_configs

  namespace "/#{controller_name}" do
    get '' do
      @artists = Artist.all
      erb :index
    end

    get '/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      erb :show
    end

  end
end
