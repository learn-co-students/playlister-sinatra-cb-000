class GenresController < ApplicationController
    include Helpers::InstanceMethods
    extend Helpers::ClassMethods

    get "/genres" do
        @genres = Genre.all
        erb :"genres/genres"
    end

    get "/genres/new" do

    end

    get "/genres/:slug" do
        @genre = Genre.find_by_slug(params[:slug])
        erb :"genres/show"
    end
end