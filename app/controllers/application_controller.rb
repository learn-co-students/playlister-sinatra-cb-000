require_relative 'artists_controller'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  use ArtistsController

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  get '/' do
    erb :index
  end

end

=begin --Useful Aliases--
  alias be="bundle exec "
  alias bake="bundle exec rake "
  alias bux="bundle exec tux"
  alias set="bundle exec rake db:migrate; bundle exec rake db:migrate SINATRA_ENV=test; bundle exec rake db:seed"
  alias reset="bundle exec rake db:migrate VERSION=0; bundle exec rake db:migrate; bundle exec rake db:migrate SINATRA_ENV=test; bundle exec rake db:seed"
=end
