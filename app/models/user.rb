class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
validates :nickname, presence: true
validates :email, presence: true,
                  uniqueness: true, 
                  inclusion: { in: @ }
validates :password, presence: true,
                     /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/,
validates :family_name, presence: true, /\A[ぁ-んァ-ン一-龥]/
validates :first_name, presence: true, /\A[ぁ-んァ-ン一-龥]/
validates :family_name_kana, presence: true, /\A[ァ-ヶー－]+\z/
validates :first_name_kana, presence: true, /\A[ァ-ヶー－]+\z/
validates :birthday, presence: true,

end
