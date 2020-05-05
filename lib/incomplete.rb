# def choose_city
#     select_city = prompt.select("Choose your city", %w (LA, SF, Houston) )
# end



# # def help
# #     choices = [{key: ''}]
# # end

# def add_hotel(hotel)
#     List.create(user_id: self.id, hotel_id: hotel.id)
# end

# def delete_hotel(id)
#     hotels.destroy(id)
# end

# # def delete_hotel_by_city(hotel_city,hotel_id)
# #     hotels.delete_all(hotel_city,hotel_id)
# # end

# def delete_all_hotels(user)
#     if user.hotels.empty?
#         puts "You have no hotels saved."
#     else #give them the option to choose to delete based on choices
#         choices = ["Delete hotels by city","Delete hotels by rating","Delete hotels by price", "Delete all hotels"]
#         user_input = prompt.select(choices)
#         if user_input == choices[0]
#             user.hotel_city
#             prompt.ask("Which city?")
#             hotels.delete_all(user_id)
#         end
#     end
# end

# def display_hotel_list_by_user
#     user_list = []
#     user = User.find(self.id)
#     user.hotels.each {|hotel| user_list << Hotel.all}
# end

# # puts "HELLO WORLD"