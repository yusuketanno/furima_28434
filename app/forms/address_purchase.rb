class AddressPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tell

  with_options presence: true do
    # validates :postal_code,  format: { with: /\A{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :tell,         format: { with: /\A(0{1}\d{9,10})\z/ }
    
  end

  def save
    # user = User.create(user_id: user.id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tell: tell, user_id: user_id, item_id: item_id)
    Purchase.create!(item_id: item_id, user_id: user_id)
  end


end