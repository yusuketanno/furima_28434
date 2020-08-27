class AddressPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tell

  with_options presence: true do
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :tell,         format: { maximum: 11 }
    
  end

  def save
    # user = User.create(user_id: user.id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tell: tell, user_id: user_id, item_id: item_id)
    Purchase.create!(item_id: item_id, user_id: user_id)
  end


end