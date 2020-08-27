require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end


  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it "記述に漏れがなければ購入できる" do
        expect(@address_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "郵便番号がないと購入できない" do
        @address_purchase.postal_code = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフン（-）がないと購入できない" do
        @address_purchase.postal_code = "1234567"
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県の情報がないと購入できない" do
        @address_purchase.prefecture_id = ""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村の情報がないと購入できない" do
        @address_purchase.city = ""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "住所の情報がないと購入できない" do
        @address_purchase.address = ""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がないと購入できない" do
        @address_purchase.tell = ""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Tell can't be blank")
      end
    end
  end
end