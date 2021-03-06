class Item < ApplicationRecord

  has_one :purchase
  belongs_to :user
  has_one_attached :image
  has_many :messages

  with_options presence: true do
    validates :image         
    validates :name          
    validates :explanation  
    validates :category_id      
    validates :item_status_id   
    validates :delivery_fee_id  
    validates :delivery_area_id 
    validates :delivery_date_id 
    validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :prefecture

  validates :category, :item_status, :delivery_fee, presence: true
  validates :category_id, :item_status_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ""
      Item.where(category_id: search)
      #, item_status_id: search, delivery_fee_id: search, delivery_date_id: search
    end
  end
end
