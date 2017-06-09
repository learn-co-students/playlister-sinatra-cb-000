ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

desc "Reload everything"
task :reload! do
  load_all "./config" if Dir.exists?("./config")
  load_all "./app" if Dir.exists?("./app")
  load_all "./lib" if Dir.exists?("./lib")
  load_all "./*.rb" if Dir.entries(".").include?(/\.rb/)
end
