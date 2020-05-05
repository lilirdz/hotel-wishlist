class User < ActiveRecord::Base
    has_many :lists
    has_many :hotels, through :lists

    wishlist = [] #would this make sense?
end