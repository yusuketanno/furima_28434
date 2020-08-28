class AddressPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tell, :token

  with_options presence: true do
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :tell,         format: { with: /\A\d{10,11}\z/ }
    validates :token
    
  end

  def save
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tell: tell, user_id: user_id, item_id: item_id)
    Purchase.create!(item_id: item_id, user_id: user_id)
  end

  
  validates :prefecture_id, numericality: { other_than: 1 }
end