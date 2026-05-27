class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :names
      t.date :birthday

      t.timestamps
    end
  end
end
