class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_one :purchase
    has_many :items
    has_one :address

    with_options presence: true do
      validates :nickname
      validates :email, uniqueness: true, 
                        format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
      validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/ }
      validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
      validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
      validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
      validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
      validates :birthday
    end
end