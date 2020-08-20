class Item < ApplicationRecord

  with_options presence: true do
    validates :image         
    validates :name          
    validates :explanation  
    validates :category      
    validates :item_status   
    validates :delivery_fee  
    validates :delivery_area 
    validates :delivery_date 
    validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, item_status, delivery_fee
  validates :category, item_status, :delivery_fee, presence: true
  validates :category_id, item_status_id, :delivery_fee_id, numericality: { other_than: 1 }

end
