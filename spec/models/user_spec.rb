require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it 'name,password,encrypted_password,first_name,last_name,first_kana,last_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザ登録ができない時' do
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'AAAAAA'
      @user.password_confirmation = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '姓（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '名（全角）が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it '姓（カナ）が空だと登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_kana = 'a1!あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end
    it '名（カナ）が空だと登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.last_kana = 'a1!あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end
    it '生年月日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  end
end

