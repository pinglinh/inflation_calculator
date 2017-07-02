class CreateUkHousePriceIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :uk_house_price_indices do |t|
      t.date :date
      t.string :region
      t.float :price_index
    end
  end
end
