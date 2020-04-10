class ShowsController < ApplicationController

    get '/shows' do
        @shows = Show.all
        erb :'shows/index'
    end


    get '/shows/new' do
        #if there isnt a user logged in, redirect back to homepage
        if !Helpers.is_logged_in?(session)
            redirect '/'
        end
        erb :'shows/new'
    end

    post '/shows' do
        show = Show.create(params)
        #find the current user that is logged in
        user = Helpers.current_user(session)
        #associate that show with the user.
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
        if !Helpers.is_logged_in?(session) || !@show || @show.user != Helpers.current_user(session)
            redirect '/'
        end
        erb :'/shows/edit'
    end

    patch '/shows/:id' do 
        show = Show.find_by(id: params[:id])
        #compare shows user with current user before making change
        if show.user == Helpers.current_user(session)
            #update params of show
            show.update(params[:show])
            flash[:message] = "Successfully updated show!"
            redirect to "/shows/#{show.id}"
        else
            redirect to "/shows"
        end
    end

    delete '/shows/:id/delete' do
        show = Show.find_by(id: params[:id])
        if show && show.user == Helpers.current_user(session)
            show.destroy
            redirect to '/shows'
        else
            redirect to '/shows'
        end
    end


end
