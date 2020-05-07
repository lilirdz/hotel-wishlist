# require 'pry'


def choose_city(user)
    cities = ["Houston", "LA", "Las Vegas", "Miami","Chicago"]
    select_city = @prompt.select("Choose your city", cities)
    puts "You selected #{select_city}"
    filtered_hotels = Hotel.all.select{|hotel| hotel.city == select_city}
    filtered_hotels.each do |x|
        puts "ID: #{x.id}, Hotel: #{x.hotel_name}, Address: #{x.address}, City: #{x.city}, Average Rating: #{x.avg_rating}, Price: #{x.price}"
    end
    hotel_names = filtered_hotels.map {|x| x.hotel_name}
    hotel_ids = filtered_hotels.map {|x| x.id}
    filter_more = @prompt.yes?("Would you like to filter some more?")
    if filter_more == true
        choose_preferences
    else
        selection = @prompt.select("Which hotel do you like?", hotel_names)
        puts selection
        puts "Hello"
        b = Hotel.find_by(hotel_name: selection)
        p b
        # c = Hotel.all.select{|hotel| hotel.hotel_name == b.hotel_name} #not hotel_ids
        # p c
        # d = c.map {|x| x.id}
        # p d
        puts "world"
        # List.find_or_create_by(hotel_id: b)
    end
    # menu()
end


def choose_preferences
    preferences = ["Average Rating", "Price"]
    user_preferences = @prompt.multi_select("Choose your preferences",preferences)
    if user_preferences == preferences[0]
        rating_buckets = [3,4,5]
        select_rating = @prompt.multi_select("Choose hotel rating preferences",rating_buckets)
        Hotel.where(avg_rating: select_rating)
    elsif user_preferences == preferences[1]
        price_range = [100,200]
        select_pricing = @prompt.select("Choose price range",price_range)
        Hotel.where(price: select_pricing)
    end
end

def display_hotels_by_filters
    puts "Here are all the hotels in #{select_city} with an average rating of #{select_rating} and a price within #{select_pricing}"
    Hotel.where(city:choose_city,avg_rating: choose_preferences, price: choose_preferences)
end


# def add_hotel(hotel)
#     List.find_or_create_by(hotel_id: hotel.id)
# end

def delete_hotel
    user_hotels = display_hotel_list_by_user
    choice = @prompt.multi_select("Select the hotel(s) you want to remove", user_hotels)
    List.destroy_by(user_id: user,hotel_id: hotel.id)
end

def delete_all_hotels
    if user.hotels.empty?
        puts "You have no hotels saved."
    else
        Hotel.delete_all(user_id: user.id) 
    end   
end

# # def delete_hotel_by_city(hotel_city,hotel_id)
# #     hotels.delete_all(hotel_city,hotel_id)
# # end

# def delete_all_hotels(user)
#     if user.hotels.empty?
#         puts "You have no hotels saved."
#     else #give them the option to choose to delete based on choices
#         choices = ["Delete hotels by city","Delete hotels by rating","Delete hotels by price", "Delete all hotels"]
#         user_input = prompt.select("Choose an option",choices)
#         if user_input == choices[0]
#             cities = ["X","Y","Z"]
#             choose_city = @prompt.select("Which city",cities)
#             # @prompt.ask("Which city?")
#             Hotel.delete_by(user_id: user, city: choose_city)
#         elsif user_input == choices[1]

#         elsif user_input == choices[2]
#         elsif user_input == choices[3]
#             Hotel.delete_all(user_id: user)
#         end
#     end
# end

# def display_hotel_list_by_user
#     user_list = []
#     user = User.find(self.id)
#     user.hotels.each {|hotel| user_list << Hotel.all}
# end

# u1 = User.create(user_name: "lili")


def display_hotel_list_by_user(user)
    List.find_by(user_id: user)
    user_list = List.joins("JOIN hotels on lists.hotel_id = hotels.id")
    p user_list
end

# binding.pry
# 0

#still need to group avg_rating and prices, in sql it's using case and renaming