class User < ActiveRecord::Base
    has_many :lists
    has_many :hotels, through: :lists

    def add_hotel(hotel)
        find_hotel = List.find_by(user_id: self.id,hotel_id: hotel.id)
        if find_hotel == nil
            List.find_or_create_by(user_id: self.id,hotel_id: hotel.id)
            puts "This hotel has been added to your list!"
        else
            puts "This hotel is already in your list!"
        end
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

    def delete_hotel(name)
        hotels.delete_by(hotel_name: name)
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