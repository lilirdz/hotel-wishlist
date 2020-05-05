class CreateHotels < ActiveRecord::Migration[5.2]
    def change 
        add_column :name, :price, :average_rating, :size, :location, :smoky_roof            
        
    end

end