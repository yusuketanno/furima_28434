class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  class Account < ActiveRecord: :Base
    with_options presence: true do |assoc|
      assoc.validates :nickname
      assoc.validates :email, uniqueness: true, 
                              inclusion: { in: @ }
      assoc.validates :password, /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/
      assoc.validates :family_name, /\A[ぁ-んァ-ン一-龥]/
      assoc.validates :first_name, /\A[ぁ-んァ-ン一-龥]/
      assoc.validates :family_name_kana, /\A[ァ-ヶー－]+\z/
      assoc.validates :first_name_kana, /\A[ァ-ヶー－]+\z/
      assoc.validates :birthday
    end
  end
end