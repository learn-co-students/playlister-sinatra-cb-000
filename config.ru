require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
#have to place Rack::MethodOverride at top otherwise it causes errors/getting 404 for patch request
use Rack::MethodOverride
use SongController
use ArtistController
use GenreController

run ApplicationController
