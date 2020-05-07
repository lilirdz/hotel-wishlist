class ChangeDatatypeForOccupancy < ActiveRecord::Migration[5.2]
  def change
    change_column :hotels, :max_occupancy, :integer
  end
end
