#defines deployment environment
ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
#Gives us all of our rake commands
require 'sinatra/activerecord/rake'


task :console do 
    Pry.start
end