class AddRelationshipToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :people, :relationship, :string
  end
end
