class GenresController < ApplicationController
  extend Concerns::Namespaceable::ClassMethods
  contoller_name = self.controller_name
  self.set_configs

  namespace "/#{controller_name}" do
    get '' do
      @genres = Genre.all
      erb :index
    end

    get '/:slug' do
      @genre = Genre.find_by_slug(params[:slug])
      erb :show
    end
  end
end
