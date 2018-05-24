class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/' do
    erb :index
  end
end


#alias reset="bundle exec rake db:migrate VERSION=0; bundle exec rake db:migrate; bundle exec rake db:migrate SINATRA_ENV=test; bundle exec rake db:seed"
