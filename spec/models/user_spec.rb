require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、birthdayが存在すれば登録できる" do
      end
      it "emailが一意であれば登録できる" do
      end
      it "emailに@が含まれていれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordが半角英数字混合であれば登録できる" do
      end
      it "ユーザー本名が、名字と名前の両方あれば登録できる" do
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であれば登録できる" do
      end
      it "ユーザー本名のフリガナが、名字と名前の両方あれば登録できる" do
      end
      it "ユーザー本名のフリガナは全角（カタカナ）であれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "emailに@が含まれていなければ登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "passwordが半角英数字混合でなければ登録できない" do
      end
      it "ユーザー本名が、名字と名前の両方なければ登録できない" do
      end
      it "ユーザー本名が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "ユーザー本名のフリガナが、名字と名前の両方なければ登録できない" do
      end
      it "ユーザー本名のフリガナが全角（カタカナ）でなければ登録できない" do
      end
    end
  end
end