class UsersController < ApplicationController

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
    if User.find_by(id: params[:id])
        @user = User.find_by(id: params[:id]) 
    else
       redirect to '/welcome' 
    end
        erb  :'/users/show'
end


end





