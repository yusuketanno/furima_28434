require 'rails_helper'

RSpec.describe User , type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        test = FactoryBot.create(:user, email: 'rrr@co.jp')
        another_user = FactoryBot.build(:user, email: 'rrr@co.jp')
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@が含まれていなければ登録できない" do
        @user.email = "1234gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include{"Eメールには@を含めてください"}
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include{"パスワードを入力してください"}
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include{"パスワードは6文字以上にしてください"}
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include{"パスワードは半角英数字混合にしてください"}
      end
      it "ユーザー本名の名字がなければ登録できない" do
        @user.family_name = ""
        expect(@user.errors.full_messages).to include{"名字を入力してください"}
      end
      it "ユーザー本名の名前がなければ登録できない" do
        @user.first_name = ""
        expect(@user.errors.full_messages).to include{"名前を入力してください"}
      end
      it "ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include{"名字は全角（漢字・ひらがな・カタカナ）で入力してください"}
      end
      it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include{"名前は全角（漢字・ひらがな・カタカナ）で入力してください"}
      end
      it "ユーザー本名のフリガナは、名字がなければ登録できない" do
        @user.family_name_kana = ""
        expect(@user.errors.full_messages).to include{"名字のフリガナを入力してください"}
      end
      it "ユーザー本名のフリガナは、名前がなければ登録できない" do
        @user.first_name_kana = ""
        expect(@user.errors.full_messages).to include{"名前のフリガナを入力してください"}
      end
      it "ユーザー本名の名字のフリガナがは全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include{"名字のフリガナがは全角（カタカナ）で入力してください"}
      end
      it "ユーザー本名の名前のフリガナがは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include{"名前のフリガナがは全角（カタカナ）で入力してください"}
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end