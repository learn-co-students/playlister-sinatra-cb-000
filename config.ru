require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#clear out all the old stuff and populate with new stuff
Artist.all.destroy
Genre.all.destroy
Song.all.destroy
SongGenre.all.destroy
jeff = LibraryParser.new
jeff.call

#load all controllers
use Rack::MethodOverride
use ArtistsController
use GenresController
use SongsController

run ApplicationController
