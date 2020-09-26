class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message              ,null: false
      t.integer :user_id        ,null: false, foreign_key: true
      t.integer :item_id        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
