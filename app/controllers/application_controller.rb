require './config/environment'

class ApplicationController < Sinatra::Base


  #Where we would put styling and images in our public folder.
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #remember what user is logged in with sessions with a hash
    enable :sessions
    set :session_secret, "vscode"
  end

  #Initial route
  get "/" do
    session.clear
    erb :welcome
  end

end
