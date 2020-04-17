class ShowsController < ApplicationController

    get '/shows' do
        @shows = Show.all
        erb :'shows/index'
    end

    #find the current user that is logged in
    #associate that show with the user.
    post '/shows' do
        show = Show.create(params)
        user = Helpers.current_user(session)
        show.user = user
        show.save
        redirect to "/users/#{user.id}"
    end

    #if there isnt a user logged in, redirect back to homepage
    get '/shows/new' do
        if !Helpers.is_logged_in?(session)
            redirect '/'
        end
            erb :'shows/new'
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
