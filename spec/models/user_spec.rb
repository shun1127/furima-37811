require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = User.new(name: '', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'test', last_name: 'test', first_kana: 'test', last_kana: 'test', birthday: '1999-11-27')
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000', first_name: 'test', last_name: 'test', first_kana: 'test', last_kana: 'test', birthday: '1999-11-27')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end