class ShowsController < ApplicationController


    get '/shows/new' do
        
        erb :'shows/new'
    end

    post '/shows' do
        show = Show.create(params)
        #find the current user that is logged in
        user = Helpers.current_user(session)
        show.user = user
        redirect to "/users/#{user.id}"
    end

end
