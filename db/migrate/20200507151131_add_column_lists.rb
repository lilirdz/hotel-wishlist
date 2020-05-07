class AddColumnLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :visited?, :string
  end
end
