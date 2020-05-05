class CreateHotels < ActiveRecord::Migration[5.2]
    def change 
        create_table :hotels do |t|
            t.string :hotel_name
            t.string :city
            t.integer :avg_rating
            t.integer :price
            t.boolean :family_rooms
            t.boolean :smoking_rooms
        end
    end

end