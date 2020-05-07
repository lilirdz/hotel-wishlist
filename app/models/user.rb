class User < ActiveRecord::Base
    has_many :lists
    has_many :hotels, through: :lists

    def add_hotel(hotel)
        List.create(user_id: self.id, hotel_id: hotel.id)
        display_list
    end

    def display_list
        user_list = []
        user = User.find(self.id)
        user.hotels.each{|hotel| user_list << [hotel.hotel_name,hotel.address,hotel.city,hotel.avg_rating,hotel.price]}
        user_list.each do |info| 
            p "Hotel: #{info[0]}, Address: #{info[1]}, City: #{info[2]}, Average Rating: #{info[3]}, Price: #{info[4]}"
        end
        user_list
    end

    def delete_hotel(id)
        hotels.destroy(id)
        display_list
    end

    def delete_all_hotels
        hotels.delete_all
        display_list
    end

    def delete_hotels_by_location(city)
        hotels.where(city: city).delete_all
        display_list
    end
end