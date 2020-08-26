class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table   :addresses do |t|
      t.string     :postal_code   ,default: ""  ,null: false
      t.integer    :prefecture_id               ,null: false
      t.string     :city          ,default: ""  ,null: false
      t.string     :address       ,default: ""  ,null: false
      t.string     :building      ,default: ""
      t.string     :tell                        ,null: false
      t.integer    :user_id                     ,null: false, foreign_key: true
      t.integer    :item_id                     ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
