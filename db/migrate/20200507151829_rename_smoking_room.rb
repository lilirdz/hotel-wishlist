class RenameSmokingRoom < ActiveRecord::Migration[5.2]
  def change
    rename_column :hotels, :smoking_rooms, :hot_tub_jacuzzi
  end
end
