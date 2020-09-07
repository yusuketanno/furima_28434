require 'rails_helper'


RSpec.describe Item , type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.created_at
    # user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload("/files/dl-android.png")
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it "記述に漏れがなければ出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "商品名がないと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品の説明がないと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリーの情報がないと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "商品状態の情報がないと出品できない" do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "配送料負担の情報がないと出品できない" do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "発送元地域の情報がないと出品できない" do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "発送までの日数の情報がないと出品できない" do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "価格の情報がないと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "価格が¥300より小さい時出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it "価格が¥9,999,999より大きい時出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end

end
