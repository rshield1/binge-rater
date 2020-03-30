require './config/environment'

class ApplicationController < Sinatra::Base


  #Where we would put styling and images in our public folder.
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Initial route
  get "/" do
    erb :welcome
  end

end
