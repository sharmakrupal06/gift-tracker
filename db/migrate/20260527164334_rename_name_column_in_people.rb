class RenameNameColumnInPeople < ActiveRecord::Migration[8.0]
  def change
    rename_column :people, :names, :name
  end
end
