class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/parse_db' do
    LibraryParser.parse

    # Flash Message when the db is populated
    flash[:message] = "Library Parsey Successfully populated database."
    
    redirect "/"
  end
end
