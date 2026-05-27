class ChangeLikedToBoolean < ActiveRecord::Migration[8.0]
  def change
    change_column :gifts_givens, :liked, :boolean, default: false, using: 'liked::boolean'
  end
end
