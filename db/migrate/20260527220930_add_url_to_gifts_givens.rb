class AddUrlToGiftsGivens < ActiveRecord::Migration[8.0]
  def change
    add_column :gifts_givens, :url, :string
  end
end
