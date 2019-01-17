require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#clear out all the old stuff and populate with new stuff
Artist.all.each do |thing|
  thing.destroy
end
Genre.all.each do |thing|
  thing.destroy
end
Song.all.each do |thing|
  thing.destroy
end
SongGenre.all.each do |thing|
  thing.destroy
end

#load stuff up
jeff = LibraryParser.new
jeff.call


#load all controllers
use Rack::MethodOverride
use ArtistsController
use GenresController
use SongsController

run ApplicationController
