require_relative '../config/environment'
require "tty-prompt"
@prompt = TTY::Prompt.new

def display_hotel_list_by_user(user)
    List.joins("JOIN hotels on lists.hotel_id = hotels.id")
    List.find_by(user_id: user.id)
end

def menu(user)
    user = User.find(user.id)
    menu = ["View your wishlist", "Add to your wishlist", "Remove hotels from your wishlist", "Restart", "Exit"]
    user_input = @prompt.select("Choose an option",menu)
    if user_input == menu[0]
        display_hotel_list_by_user(user)
        #menu(user)
    elsif user_input == menu[1]
        #select and add to list method
        choose_city(user)
        menu(user)
    elsif user_input == menu[2]
        #remove from list method
    elsif user_input == menu[3]
        #need to clear current user data if a new user is using app
        welcome
        menu()
    elsif user_input == menu[4]
        puts "See you next time!"
    end
end


def welcome
    puts "Hello! Welcome to your Hotel Wishlist!"
    user_input = @prompt.ask('What is your name?',required: true)
    puts "Hello #{user_input}"
    user = User.find_or_create_by(user_name: user_input)
    menu(user)
end

# @test = welcome
# puts test
welcome

# def menu(user)
#     user = User.find(user.id)
#     menu = ["View your wishlist", "Add to your wishlist", "Remove hotels from your wishlist", "Restart", "Exit"]
#     user_input = @prompt.select("Choose an option",menu)
#     if user_input == menu[0]
#         display_hotel_list_by_user
#     elsif user_input == menu[1]
#         #select and add to list method
#     elsif user_input == menu[2]
#         #remove from list method
#     elsif user_input == menu[3]
#         #need to clear current user data if a new user is using app
#         welcome
#         menu()
#     elsif user_input == menu[4]
#         puts "See you next time!"
#     end
# end

# def display_hotel_list_by_user(user)
#     List.find_by(user_id: user.id)
#     List.joins("JOIN hotels on lists.hotel_id = hotels.id")
# end

