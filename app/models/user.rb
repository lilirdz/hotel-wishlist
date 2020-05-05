class User < ActiveRecord::Base
    has_many :lists
    has_many :hotels, through :lists
end