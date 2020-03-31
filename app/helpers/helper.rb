class Helpers


def self.current_user(session)
    #what user is supposed to be logged in
    User.find_by(id: session[:user_id])

end

def self.is_logged_in?(session)
    #is there a user id in our session?
    session[:user_id] ? true : false
end


end

end
