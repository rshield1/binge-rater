class UsersController < ApplicationController

get "/users" do
    if Helpers.is_logged_in?(session)
        #displays all users if user is logged in.
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
    #Uses params to authenticate a specific user in the database.  If user doesnt exist, redirect to homepage
    @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
    #create a new session hash using the user's id
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
        else
        redirect to '/login'
        end
end


get '/signup' do
    if Helpers.is_logged_in?(session)
        user = Helpers.current_user(session)
        #creates dynamic route
        redirect to "/users/#{user.id}"
    end
    erb :'/users/signup'
end

#taken from signup.erb form for params to create new user
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

get '/logout' do
    #clears session to log out the user.
    session.clear
    redirect to '/'
    # erb :'/users/login'
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
    #send users to their show page
        erb  :'/users/show'
end

# need assistance on delete method

get "/delete" do
    if Helpers.is_logged_in?(session) && User.find_by(id: params[:id])
        user = User.find_by(username: params[:username])
        binding.pry
        user = nil
        user.save
        session.clear
        redirect to '/' 
    end
end






end





