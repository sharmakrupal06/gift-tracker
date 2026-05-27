class CreateGiftsGivens < ActiveRecord::Migration[8.0]
  def change
    create_table :gifts_givens do |t|
      t.string :gift
      t.integer :people_id
      t.string :liked
      t.date :given_on
      t.text :notes
      t.string :occasion
      t.integer :price

      t.timestamps
    end
  end
end
