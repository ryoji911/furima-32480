require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '商品購入ができる時' do
      it '全てが入力されていれば購入できること' do
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postal_codeが空だと購入できないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できないこと' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'areaが空だと購入できないこと' do
        @order.area_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it 'areaが0だと購入できないこと' do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できないこと' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフンがあると購入できないこと' do
        @order.phone_number = "090-1234-5678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Not include hyphen(-) (maximum is 11 characters)")
      end
      it 'phone_numberが12桁以上だと購入できないこと' do
        @order.phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Not include hyphen(-) (maximum is 11 characters)")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
