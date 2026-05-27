class AddUrlToGiftIdeas < ActiveRecord::Migration[8.0]
  def change
    add_column :gift_ideas, :url, :string
  end
end
