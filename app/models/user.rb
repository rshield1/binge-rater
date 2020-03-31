#Associates model with table and use methods within AR
class User < ActiveRecord::Base
has_many :recipes

#secures the password with a params hash (bcrypt gem)
has_secure_password

end