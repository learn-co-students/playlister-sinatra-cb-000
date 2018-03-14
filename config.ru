require './config/environment'
require './app/controllers/artists_controller'
require './app/controllers/genres_controller'
require './app/controllers/songs_controller'
require 'rack-flash'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use Rack::Flash

use ArtistsController
use GenresController
use SongsController
run ApplicationController
