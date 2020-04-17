class UsersController < ApplicationController


#displays all users if user is logged in.
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
    #Uses params to authenticate a specific user in the database.  If user doesnt exist, redirect to homepage
    #create a new session hash using the user's id
post '/login' do
    @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            flash[:message] = "Invalid username or password!"    
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
#check the validity of user
#user id is unique to each user
post "/signup" do
    @user = User.create(params) 
        if @user.valid?
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"        
        else 
            flash[:message] = "Please log into your account"
            redirect to '/signup'
        end
end

#clears session to log out the user.

get '/logout' do   
    session.clear
    redirect to '/'
end

#create a dynamic route for id
#user has_many shows 
#send users to their show page

get '/users/:id' do
    if Helpers.is_logged_in?(session) && User.find_by(id: params[:id])
        @user = User.find_by(id: params[:id])
        @shows = @user.shows
    else
       redirect to '/welcome' 
    end
        erb  :'/users/show'
end

delete "/delete" do
    if Helpers.is_logged_in?(session)
        Helpers.current_user(session).delete
        session.clear
        redirect to '/' 
    end
end






end





