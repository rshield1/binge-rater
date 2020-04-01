class ShowsController < ApplicationController

    get '/shows' do
        @shows = Show.all
        erb :'shows/index'
    end


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

    get '/shows/:id/edit' do
        @show = Show.find_by(id: params[:id])
        erb :'/shows/edit'
    end

    patch '/shows/:id' do 

    end



end
