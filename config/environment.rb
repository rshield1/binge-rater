ENV['SINATRA_ENV'] ||= "development"
require 'em/pure_ruby' if not defined?(EventMachine)


#requiring our gems to setup
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#Connecting our database
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# require './app/controllers/application_controller'
require_all 'app'
