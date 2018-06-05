ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
require_all 'lib'

## Why must I require_relative this line?
## This should have been taken-care off by the require_all 'app'
# Error Msg without line below:
# RequireAll::LoadError: Could not require /Users/nichia/Development/code/playlister-sinatra-cb-000/app/
# models/artist.rb (uninitialized constant Artist::Concerns). Please require the necessary files
#require_relative '../app/models/concerns/slugifiable'

# Problem due to require_all v2.0.0. Fixed by using gem require_all v1.5.0
