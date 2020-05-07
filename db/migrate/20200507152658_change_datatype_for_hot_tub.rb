class ChangeDatatypeForHotTub < ActiveRecord::Migration[5.2]
  def change
    change_column :hotels, :hot_tub_jacuzzi, :string
  end
end
