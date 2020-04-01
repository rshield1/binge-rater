class UsersController < ApplicationController

get "/users" do
    if Helpers.is_logged_in?(session)
        @users = User.all    
    else
        redirect to '/'
    end
    erb :'/users/index'
end

get '/login' do
    erb :'/users/login'
end

post '/login' do
    @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
        else
        redirect to '/login'
        end
end


get '/signup' do
    if Helpers.is_logged_in?(session)
        user = Helpers.current_user(session)
        redirect to "/users/#{user.id}"
    end
    erb :'/users/signup'
end

#taken from signup.erb form for params
post "/signup" do
    @user = User.create(params)
    #check the validity of user
        if @user.valid?
            session[:user_id] = @user.id
        #user id is unique to each user
            redirect to "/users/#{@user.id}"
        else 
            redirect to '/signup'
        end
end

#create a dynamic route for id

get '/users/:id' do
    if Helpers.is_logged_in?(session) && User.find_by(id: params[:id])
        @user = User.find_by(id: params[:id])
        #user has_many shows 
        @shows = @user.shows
    else
       redirect to '/welcome' 
    end
        erb  :'/users/show'
end



get '/logout' do
    session.clear
    redirect to '/'
    # erb :'/users/login'
end


end





