class CreateSearchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :search_results do |t|
      t.string :name
      t.string :price
      t.string :retailer_name
      t.string :retailer_url
      t.integer :search_word_id
      t.timestamps
    end
  end
end
