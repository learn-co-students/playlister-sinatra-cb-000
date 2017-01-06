class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :erb, layout: :layout
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end
end
