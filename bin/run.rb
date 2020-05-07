require_relative '../config/environment'



require "tty-prompt"

$prompt = TTY::Prompt.new

def welcome
    puts "Hello! Welcome to your Hotel Wishlist!"  #Greeting
    $prompt.ask('What is your name?')       #first question
    chooseCity
end

def chooseCity
    city_choice = $prompt.select("Choose your city?", %w(Houston LA LasVegas Miami Chicago)) #user has a choice to make from options
    
    display_hotels(city_choice)     #apply this method to display hotels in that city choice
end

def hotelRecommended(hotel_choice)
    if getChosenHotelRating(hotel_choice) < 5
        name_of_hotel = (Hotel.find_by avg_rating: getChosenHotelRating(hotel_choice)+1).hotel_name
    end
    # else
    #     puts "Yay, everyone likes to lodge at #{hotel_choice}"
    #     key = (Hotel.find_by hotel_name: hotel_choice).id
    #     List.create(hotel_id: key) 
    # end
end

   
def display_hotels(city_choice)
    
    if city_choice == "Houston"     #calls on a method (houston) and converts its return value to multichoice list 
        hotel_choice = $prompt.select("Choose Your Hotel", houston)
    end
    recommend(name_of_hotel)
end

def houston 
    arr = Hotel.where("city==?","Houston")    #this prints out the *names* of hotels in the chosen city
    arr.map do |h|
        h.hotel_name
    end
end

def getChosenHotelRating(hotel_choice)            #basically just searches for the hotel instance by name and returns its rating
    (Hotel.find_by hotel_name: hotel_choice).avg_rating
end




def recommend(name_of_hotel)                           #can we pass a method into a string using {} ?
    if getChosenHotelRating(hotel_choice) == 3
        response = $prompt.yes?("Great! Would you mind checking out #{name_of_hotel} with a higher max. occupancy?")
        convert_response
    elsif getChosenHotelRating(hotel_choice) == 4
        response = $prompt.yes?("Awesome! We also have a luxurious style option with a hot tub/jacuzzi for #{} more. Would you consider this choice?")
        convert_response
            
    end
    
end

def convert_response(response, hotel_choice, name_of_hotel)
    if response == "Yes"
        iden = (Hotel.find_by hotel_name: name_of_hotel).id
        List.create(hotel_id: iden)     #come back to this
    else
        iden = (Hotel.find_by hotel_name: hotel_choice).id
        List.create(hotel_id: iden)
    end
end




welcome