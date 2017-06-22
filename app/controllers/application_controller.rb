class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  configure do
   enable :sessions
   set :session_secret, "super_dooper_secret" # can be set to any string value
  end

  get '/' do
    erb :index
  end
end
