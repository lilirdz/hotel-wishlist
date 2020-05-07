def choose_city(user)
    cities = ["Houston", "LA", "Las Vegas", "Miami","Chicago"]
    select_city = @prompt.select("Choose your city", cities)
    puts "You selected #{select_city}"
    filtered_hotels = Hotel.all.select{|hotel| hotel.city == select_city}
    filtered_hotels.each do |x|
       puts "Hotel: #{x.hotel_name}, Address: #{x.address}, City: #{x.city}, Average Rating: #{x.avg_rating}, Price: #{x.price}"
    end
    hotel_names = filtered_hotels.map {|x| x.hotel_name}
    hotel_ids = filtered_hotels.map {|x| x.id}
    filter_more = @prompt.yes?("Would you like to filter some more?")
    if filter_more == true
        choose_preferences
    else
        selection = @prompt.ask("Which hotel do you like?")
        puts "Hello"
        # b = Hotel.find_by(hotel_name: selection)
        b = Hotel.all.select{|x| x.hotel_name == selection}
        choosen_hotel_id = b.map{|x| x.id}
        # puts choosen_hotel_id
        user.List.find_by_or_create(hotel_id:choosen_hotel_id)
        # user.add_hotel(choosen_hotel_id)
        puts "The #{selection} Hotel has been added to your list!"
        user.display_list
    end
    # menu()
end


def choose_preferences
    preferences = ["Average Rating", "Price"]
    user_preferences = @prompt.select("Choose your preferences",preferences)
    if user_preferences == preferences[0]
        rating_buckets = [3,4,5]
        select_rating = @prompt.select("Choose hotel rating preferences",rating_buckets)
        rating_hotels = Hotel.where(avg_rating: select_rating)
        rating_hotels.each do |x|
            puts "Hotel: #{x.hotel_name}, Address: #{x.address}, City: #{x.city}, Average Rating: #{x.avg_rating}, Price: #{x.price}"
        end
        ask_add_hotel = @prompt.yes?("Would you like to add a hotel?")
        if ask_add_hotel == true
            select_hotel = @prompt.ask("Please type the hotel you wish to add")
            #add hotel to list goes here
            puts "#{select_hotel} has been added to your list!"
        end
    elsif user_preferences == preferences[1]
        price_range = [100,200]
        select_pricing = @prompt.select("Choose price range",price_range)
        price_hotels = Hotel.where(price: select_pricing)
        price_hotels.each do |x|
            puts "Hotel: #{x.hotel_name}, Address: #{x.address}, City: #{x.city}, Average Rating: #{x.avg_rating}, Price: #{x.price}"
        end
        ask_add_hotel = @prompt.yes?("Would you like to add a hotel?")
        if ask_add_hotel == true
            select_hotel = @prompt.ask("Please type the hotel you wish to add")
            #add hotel to list goes here
            puts "#{select_hotel} has been added to your list!"
        end
    end
end

# def display_hotels_by_filters
#     puts "Here are all the hotels in #{select_city} with an average rating of #{select_rating} and a price within #{select_pricing}"
#     Hotel.where(city:choose_city,avg_rating: choose_preferences, price: choose_preferences)
# end


def delete_options(user)
    if user.hotels.empty?
        puts "You have no hotels saved."
    else
        choices = ["Delete hotels by city","Delete hotel by name", "Delete all hotels"]
        user_input = @prompt.select("Choose an option",choices)
        if user_input == choices[0]
            cities = ["Houston", "LA", "Las Vegas", "Miami","Chicago"]
            choose_city = @prompt.select("Which city?",cities)
            user.delete_hotels_by_location(choose_city)
            puts "All hotels in #{choose_city} have been removed from your list."
        elsif user_input == choices[1]
            user.display_list
            choose_hotel = @prompt.ask("Which hotel do you want to delete?")
            user.delete_hotel(choose_hotel)
            puts "#{choose_hotel} has been removed from your list."
        elsif user_input == choices[2]
            user.delete_all_hotels
            puts "All hotels have been removed from your list."
        end
    end
end




# def display_hotel_list_by_user(user)
#     List.find_by(user_id: user)
#     user_list = List.joins("JOIN hotels on lists.hotel_id = hotels.id")
#     p user_list
# end


#still need to group avg_rating and prices, in sql using case and renaming