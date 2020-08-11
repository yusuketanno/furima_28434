require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailが一意であれば登録できる" do
        duplicate_user = @user.dup
        @user.save
        assert_not duplicate_user.valid?
      end
      it "emailに@が含まれていれば登録できる" do
        
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        
      end
      it "ユーザー本名が、名字と名前の両方あれば登録できる" do
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナが、名字と名前の両方あれば登録できる" do
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは全角（カタカナ）であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていなければ登録できない" do
        
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
      end
      it "ユーザー本名が、名字と名前の両方なければ登録できない" do
        @user.family_name = ""
        @user.first_name = ""
        expect(@user.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザー本名が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "ユーザー本名のフリガナが、名字と名前の両方なければ登録できない" do
        @user.family_name_kana = ""
        @user.first_name_kana = ""
        expect(@user.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザー本名のフリガナが全角（カタカナ）でなければ登録できない" do
      end
    end
  end
end