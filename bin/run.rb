require_relative '../config/environment'
require "tty-prompt"

@prompt = TTY::Prompt.new

def welcome
    puts "Hello! Welcome to your Hotel Wishlist!"
    user_input = @prompt.ask('What is your name?',required: true)
end
@test = welcome
puts test
