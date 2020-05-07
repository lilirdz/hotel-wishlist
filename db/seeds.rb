require 'pry'
User.destroy_all
Hotel.destroy_all
List.destroy_all


u1 = User.create(user_name: "lili")
u2 = User.create(user_name: "roxa")

h1 = Hotel.create(hotel_name:"Marbella",address:"123 Main",city: "Houston",avg_rating: 4.8,price: 100, family_rooms:true,smoking_rooms:false)
Hotel.create(hotel_name:"Bluebird Hotels",address:"2543 Bellaire Boulevard",city:"Houston",avg_rating:3.9,price:70,family_rooms:true,smoking_rooms:true)
Hotel.create(hotel_name:"Grand Forte",address:"673 McKinney drive",city:"Houston",avg_rating:4.9,price:120,family_rooms:false,smoking_rooms:true)
Hotel.create(hotel_name:"Peninsula Resort",address:"241 Gessner road",city:"Houston",avg_rating:3.5,price:54,family_rooms:false,smoking_rooms:false)
# h = Hotel.create(hotel_name:"The Lodge at Bay Island",address:"",city:"",avg_rating:"",price:"",family_rooms:"",smoking_rooms:"")
Hotel.create(hotel_name:"The Tipton",address:"321 Main",city: "LA",avg_rating: 4.6,price: 80,family_rooms: true,smoking_rooms:false)
Hotel.create(hotel_name:"Candleview Coast",address:"143 Aurora drive",city:"LA",avg_rating:5,price:160,family_rooms:true,smoking_rooms:true)
Hotel.create(hotel_name:"Bloomingdale Creek Resort",address:"1489 Riverview lane",city:"LA",avg_rating:4.2,price:119,family_rooms:false,smoking_rooms:true)
Hotel.create(hotel_name:"Kingston Rock Paradise",address:"1114 Catalina drive",city:"LA",avg_rating:3.9,price:87,family_rooms:false,smoking_rooms:false)
# h = Hotel.create(hotel_name:"Platinum Point Resort",address:"",city:"",avg_rating:"",price:"",family_rooms:"",smoking_rooms:"")
Hotel.create(hotel_name:"Quaint Velvet Hotel",address:"5713 W. Bancroft street",city:"Las Vegas",avg_rating:4.4,price:110,family_rooms:true,smoking_rooms:false)
Hotel.create(hotel_name:"Spotlight Creeks",address:"1012 Poncetelo drive",city:"Las Vegas",avg_rating:5,price:137,family_rooms:true,smoking_rooms:true)
Hotel.create(hotel_name:"The Venetian Spring Resort",address:"2564 Riverrun lane",city:"Las Vegas",avg_rating:3.8,price:80,family_rooms:false,smoking_rooms:false)
Hotel.create(hotel_name:"The Lakefront Dream",address:"9105 Elcamino lane",city:"Las Vegas",avg_rating:4.8,price:120,family_rooms:true,smoking_rooms:true)
# h = Hotel.create(hotel_name:"Sandy Orchid",address:"",city:"",avg_rating:"",price:"",family_rooms:"",smoking_rooms:"")
Hotel.create(hotel_name:"Vacation deLuxe",address:"254 Greenfield drive",city:"Miami",avg_rating:4,price:96,family_rooms:false,smoking_rooms:true)
Hotel.create(hotel_name:"Springbrook View Resort",address:"312 Dellireal close",city:"Miami",avg_rating:4.7,price:140,family_rooms:true,smoking_rooms:true)
Hotel.create(hotel_name:"Grand Rooftop Resort",address:"713 Campdavilla creeks place",city:"Miami",avg_rating:3.7,price:78,family_rooms:true,smoking_rooms:false)
Hotel.create(hotel_name:"Noble Magic Dune",address:"4688 Bisoncreek drive",city:"Miami",avg_rating:5,price:110,family_rooms:false,smoking_rooms:true)
# h = Hotel.create(hotel_name:"Night In Paradise Resort",address:"",city:"",avg_rating:"",price:"",family_rooms:"",smoking_rooms:"")
Hotel.create(hotel_name:"Lexington Delloir",address:"3112 Roxanne quarters drive",city:"Chicago",avg_rating:3.6,price:65,family_rooms:false,smoking_rooms:false)
Hotel.create(hotel_name:"Riverdale Resort",address:"490 Annexil lane",city:"Chicago",avg_rating:4.9,price:120,family_rooms:true,smoking_rooms:true)
Hotel.create(hotel_name:"The Canaseries",address:"219 Country parkside drive",city:"Chicago",avg_rating:3.8,price:78,family_rooms:false,smoking_rooms:true)
Hotel.create(hotel_name:"Grand Maxim Hotel",address:"781 Devonaire driveway",city:"Chicago",avg_rating:4.7,price:106,family_rooms:true,smoking_rooms:false)



l1 = List.create(user_id: u1.id, hotel_id: h1.id)

binding.pry
0

