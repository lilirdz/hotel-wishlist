class RenameFamilyRoom < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotels, :family_rooms, :max_occupancy
  end
end
