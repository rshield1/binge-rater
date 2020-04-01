class ShowsController < ApplicationController


    get '/shows/new' do
        if !Helpers.is_logged_in?(session)
            redirect '/'
        end
        erb :'shows/new'
    end

    post '/shows' do
        show = Show.create(params)
        #find the current user that is logged in
        user = Helpers.current_user(session)
        show.user = user
        show.save
        redirect to "/users/#{user.id}"
    end


    get '/shows/:id' do
        if !Helpers.is_logged_in?(session)
            redirect '/'
        end
        @show = Show.find_by(id: params[:id])

        erb :'shows/show'
    end



end
