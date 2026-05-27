class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.date :date
      t.string :note
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
