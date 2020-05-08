require_relative '../config/environment'


require "tty-prompt"

$prompt = TTY::Prompt.new


def welcome
    puts "Hello! Welcome to your Hotel Wishlist!"  #Greeting
    @name = $prompt.ask('What is your name?')       #first question
    @password = $prompt.mask('What is your password?')
    menu
    
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
    @city_choice = $prompt.select("Choose your city?", %w(Houston LA LasVegas Miami Chicago), active_color: :on_bright_magenta) #user has a choice to make from options
    
    display_hotels(@city_choice)     #apply this method to display hotels in the city that was chosen
end


   
def display_hotels(city_choice)
    
    if city_choice == "Houston"     #calls on a method (houston) and converts its return value to multichoice list 
        @hotel_choice = $prompt.select("Choose Your Hotel", houston, active_color: :on_bright_green)
    elsif city_choice == "LA"
        @hotel_choice = $prompt.select("Choose Your Hotel", la, active_color: :on_bright_green)
    elsif city_choice == "Las Vegas"
        @hotel_choice = $prompt.select("Choose Your Hotel", lasvegas, active_color: :on_bright_green)
    elsif city_choice == "Miami"
        @hotel_choice = $prompt.select("Choose Your Hotel", miami, active_color: :on_bright_green)
    elsif city_choice == "Chicago"
        @hotel_choice = $prompt.select("Choose Your Hotel", chicago, active_color: :on_bright_green)
    end
    getChosenHotelRating(@hotel_choice)
    
end


def getChosenHotelRating(hotel_choice)          #basically just searches for the hotel instance by name and returns its rating
    @rating = (Hotel.find_by hotel_name: @hotel_choice).avg_rating
    # puts @rating
    recommend(@rating)
    # Hotel.where("hotel_name = ?", @hotel_choice)
    # "you're good"
end

def recommend(rating)                           #can we pass a method into a string using {} ?
    
    if  @rating == 4
        @response = $prompt.yes?("Awesome! We also have a luxurious style option with a hot tub/jacuzzi. Would you consider this choice?")
        hotelfivestar(@response)
    elsif @rating == 3
        @response = $prompt.yes?("Great! Would you mind checking out another with a higher max. occupancy?")
        hotelfourstar(@response)
    else
        puts "You've made an option for the highest-rated hotel in your city"
        $prompt.yes?('Have you visited this hotel previously?')
        yesorno(@ans)
        puts "Your entry has been saved 😍"
        
    end
    
    
end


def hotelfivestar(response)
    
    if @response == true
        
        option = (Hotel.find_by avg_rating: 5).hotel_name
        $prompt.select("Choose an option", [option], active_color: :on_bright_red)
        puts "This is the absolute BEST hotel in town"
        @ans = $prompt.yes?('Have you visited this hotel previously?')
        yesorno(@ans)
        puts "Your entry has been saved 😍"
        partingMessage
    end 

        
end

def yesorno(ans)
    if @ans == true
        #update visited? column to "Yes" for this hotel
    elsif @ans == false
        #update visited? column to "No" for this hotel
    end
end


def hotelfourstar(response)
    if @response == true
        
        option = (Hotel.find_by avg_rating: 4, city: @city_choice).hotel_name
        $prompt.select("Choose an option", [option], active_color: :on_bright_red)
        puts "Great choice! You'll absolutely love it there"
        @ans = $prompt.yes?('Have you visited this hotel previously?')
        yesorno(@ans)
        puts "Your entry has been saved 😍"
    end
end


def partingMessage
    "Thanks for using our app. Please check back for more exciting features"
end





def houston 
    arr = Hotel.where("city==?","Houston")    #this prints out the *names* of hotels in the chosen city
    arr.map do |x|
        x.hotel_name
    end
end

def la 
    arr = Hotel.where("city==?","LA")    #this prints out the *names* of hotels in the chosen city
    arr.map do |x|
        x.hotel_name
    end
end

def lasvegas 
    arr = Hotel.where("city==?","Las Vegas")    #this prints out the *names* of hotels in the chosen city
    arr.map do |x|
        x.hotel_name
    end
end

def miami 
    arr = Hotel.where("city==?","Miami")    #this prints out the *names* of hotels in the chosen city
    arr.map do |x|
        x.hotel_name
    end
end

def chicago 
    arr = Hotel.where("city==?","Chicago")    #this prints out the *names* of hotels in the chosen city
    arr.map do |x|
        x.hotel_name
    end
end


welcome

