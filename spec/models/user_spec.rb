require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが５文字以下だと保存できない' do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが存在してもpassword_confirmationが空だと保存できないこと' do
      @user.password_confirmation = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_readingが空だと保存できないこと' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it 'first_name_readingが空だと保存できないこと' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'last_name_readingが全角カナでないと保存できないこと' do
      @user.last_name_reading = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
    end
    it 'first_name_readingが全角カナでないと保存できないこと' do
      @user.first_name_reading = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
    end
    it 'birth_dayが空だと保存できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
