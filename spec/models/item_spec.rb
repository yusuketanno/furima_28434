require 'rails_helper'


RSpec.describe Item , type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it "記述に漏れがなければ出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it "画像がないと出品できない" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報がないと出品できない" do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品状態の情報がないと出品できない" do
        @item.item_status = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it "配送料負担の情報がないと出品できない" do
        @item.delivery_fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "発送元地域の情報がないと出品できない" do
        @item.delivery_area = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it "発送までの日数の情報がないと出品できない" do
        @item.delivery_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "価格の情報がないと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥300より小さい時出品できない" do
        @item.price < 300
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "価格が¥9,999,999より大きい時出品できない" do
        @item.price > 9999999
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end

end
