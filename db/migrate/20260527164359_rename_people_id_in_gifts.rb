class RenamePeopleIdInGifts < ActiveRecord::Migration[8.0]
  def change
    rename_column :gifts_givens, :people_id, :person_id
  end
end
