#Associates model with table and use methods within AR
class User < ActiveRecord::Base
has_many :recipes

#gives you access to valid? method in your user class
#it checks the validity of your user


validates :username, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true



#secures the password with a params hash (bcrypt gem)
has_secure_password

end