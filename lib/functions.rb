def choose_city
    cities = ["Houston", "LA", "Las Vegas", "Miami","Chicago"]
    select_city = @prompt.select("Choose a city", cities)
    puts "You selected #{select_city}"
    filtered_hotels = Hotel.all.select{|hotel| hotel.city == select_city}
    filtered_hotels.each do |x|
       puts "Hotel: #{x.hotel_name}, Address: #{x.address}, City: #{x.city}, Average Rating: #{x.avg_rating}, Price: #{x.price}"
    end
end

def more_filters?(user)
    filter_more = @prompt.yes?("Do you want to also filter by price or rating?")
    if filter_more == true
        choose_preferences(user)
    else
        selection = @prompt.ask("Which hotel would you like to add to your list?")
        chosen_hotel = Hotel.find_by(hotel_name: selection)
        user.add_hotel(chosen_hotel)
        #ty's code goes here
    end
end


def choose_preferences(user)
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
            chosen_hotel = Hotel.find_by(hotel_name: select_hotel)
            user.add_hotel(chosen_hotel)
            #ty's code goes here
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
            chosen_hotel = Hotel.find_by(hotel_name: select_hotel)
            user.add_hotel(chosen_hotel)
            #ty's code goes here
        end
    end
end

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