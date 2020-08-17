class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :image
      t.string  :name
      t.text    :explanation
      t.integer :category
      t.integer :item_status
      t.integer :delivery_fee
      t.integer :delivery_area
      t.integer :delivery_date
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
