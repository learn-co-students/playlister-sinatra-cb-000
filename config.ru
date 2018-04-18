require './config/environment'


use Rack::MethodOverride
use SongController
use ArtistsController
use GenreController
run ApplicationController
