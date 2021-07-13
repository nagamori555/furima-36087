require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe 'アドレス登録' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも残りすべての値が正しく入力されていれば保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeは全角数字だと登録できない' do
        @purchase_address.postal_code = '１２３４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeに数字以外の文字を打つと登録できない' do
        @purchase_address.postal_code = 'あかさたな'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '前３桁、後４桁の桁数を間違えると登録できない' do
        @purchase_address.postal_code = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが0だと保存できないこと' do  
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'cityはアルファベットでは登録できない' do
        @purchase_address.city = 'tokyouto'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it 'cityにスペースが入ると登録できない' do
        @purchase_address.city = '東京都　世田谷区'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it 'cityに記号を打つと登録できない' do
        @purchase_address.city = '東京都％＋世田谷区'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it 'cityは数字では登録できない' do
        @purchase_address.city = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it 'house_numberは空だと登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'house_numberは記号があると登録できない' do
        @purchase_address.house_number = '青山&3丁目〜２'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number is invalid. Input full-width characters.")
      end
      it 'house_numberはスペースが入ると登録できない' do
        @purchase_address.house_number = '青山　3丁目'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number is invalid. Input full-width characters.")
      end
      it 'house_numberはアルファベットでは登録できない' do
        @purchase_address.house_number = 'abcdefg'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number is invalid. Input full-width characters.")
      end
      it 'telephoneは10桁未満だと登録できない' do
        @purchase_address.telephone = '090000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid.type 11 digits.")
      end
      it 'telephoneは12桁以上だと登録できない' do
        @purchase_address.telephone = '090000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid.type 11 digits.")
      end
      it 'telephoneは空だと登録できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid.type 11 digits.")
      end
      it 'telephoneは数字以外では登録できない' do
        @purchase_address.telephone = 'あいうえお'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid.type 11 digits.")
      end
      it 'telephoneはハイフンがあると登録できない' do
        @purchase_address.telephone = '090-2222-2222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid.type 11 digits.")
      end
      it 'telephoneは全角数字だと登録できない' do
        @purchase_address.telephone = '０９０２２２２２２２２'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid.type 11 digits.")
      end
      it 'tokenがないと登録できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがないと登録できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと登録できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end

  end

end