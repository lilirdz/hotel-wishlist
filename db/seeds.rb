require 'pry'
User.destroy_all
Hotel.destroy_all

u1 = User.create(user_name: "lili")
u2 = User.create(user_name: "roxy")

h1 = Hotel.create(hotel_name:"Marbella",address:"123 Main",city: "Houston",avg_rating: 4.8,price: 100, family_rooms:true,smoking_rooms:false)
h2 = Hotel.create(hotel_name:"Tipton",address:"321 Main",city: "LA",avg_rating: 4.6,price: 50,family_rooms: true,smoking_rooms:true)

l1 = List.create(user_id: u1.id, hotel_id: h1.id)

binding.pry
0

