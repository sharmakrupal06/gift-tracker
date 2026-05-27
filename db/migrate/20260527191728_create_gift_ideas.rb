class CreateGiftIdeas < ActiveRecord::Migration[8.0]
  def change
    create_table :gift_ideas do |t|
      t.integer :person_id
      t.string :description
      t.boolean :purchased

      t.timestamps
    end
  end
end
