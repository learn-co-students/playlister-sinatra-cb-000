require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  

get '/genres' do 
  @genres = Genre.all 
  erb :'/genres/index/'
end 







end 
