require './config/environment'

#If migrations need to be ran, raise this particular error
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


#This is where we run our application
#Use 'use' to use multiple controllers users/show/

#MethodOverride Adds hidden input field to use patch methods/edit/delete forms
use Rack::MethodOverride
use UsersController
use ShowsController
run ApplicationController
