#Associates model with table and use methods within AR
class Show < ActiveRecord::Base
    
belongs_to :user
has_many :ratings

end