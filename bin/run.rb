require_relative '../config/environment'


require "tty-prompt"

$prompt = TTY::Prompt.new



def welcome
    puts "Hello! Welcome to your Hotel Wishlist!"  #Greeting
    @name = $prompt.ask('What is your name?')       #first question
    @password = $prompt.mask('What is your password?')
    menu
    # profile(@name, @password)
end


def menu
    menu_choice = $prompt.select("Choose an option", ["Choose a city", "View your profile information"], active_color: :red)
    if menu_choice == "Choose a city"
        chooseCity
    elsif menu_choice == "View your profile information"
        profile(@name, @password)
    end
end


def profile(name, password)
    puts @name
    puts @password
    $prompt.yes?('Would you like to choose a city?')
    
        chooseCity
        
end


def chooseCity
    city_choice = $prompt.select("Choose your city?", %w(Houston LA LasVegas Miami Chicago), active_color: :on_bright_magenta) #user has a choice to make from options
    
    display_hotels(city_choice)     #apply this method to display hotels in the city that was chosen
end


   
def display_hotels(city_choice)
    
    if city_choice == "Houston"     #calls on a method (houston) and converts its return value to multichoice list 
        @hotel_choice = $prompt.select("Choose Your Hotel", houston, active_color: :on_bright_green)
    end
    getChosenHotelRating(@hotel_choice)
    # testing
    # puts "you're good"
    
    # recommend
end


def getChosenHotelRating(hotel_choice)          #basically just searches for the hotel instance by name and returns its rating
    name = Hotel.find_by hotel_name: @hotel_choice
    puts name
    # Hotel.where("hotel_name = ?", @hotel_choice)
    # "you're good"
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



def testing
    puts @hotel_choice
end

def houston 
    arr = Hotel.where("city==?","Houston")    #this prints out the *names* of hotels in the chosen city
    arr.map do |h|
        h.hotel_name
    end
end



def recommend                           #can we pass a method into a string using {} ?
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