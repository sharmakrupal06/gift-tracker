class AddNotesToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :people, :notes, :text
  end
end
