class UsersController < ApplicationController

get '/signup' do
    erb :'/users/signup'
end

#taken from signup.erb form for params
post "/users" do
    user = User.create(params)
    #check the validity of user
    if user.valid?
        session[:user_id] = user.id
#user id is unique to each user
        redirect to "/users/#{@user.id}"
    else 
        redirect to '/signup'
end

#create a dynamic route for id

get '/users/:id' do
    if User.find_by(id: params[:id])
    @user = User.find_by(id: params[:id]) 
    else
       redirect to '/welcome' 
    end
    erb: '/users/show'
end

end
