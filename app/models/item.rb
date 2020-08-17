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

end
