require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと保存できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空だと保存できないこと' do  
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが0だと保存できないこと' do  
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが0だと保存できないこと' do  
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_fee_idが0だと保存できないこと' do  
        @item.delivery_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'prefecture_idが0だと保存できないこと' do  
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_ship_idが0だと保存できないこと' do  
        @item.days_to_ship_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが0だと保存できないこと' do  
        @item.price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'priceが10000000円以上だと保存できないこと' do  
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'priceが全角数字だと保存できないこと' do  
        @item.price = '９００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'priceがローマ字だと保存できないこと' do  
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'priceがひらがなだと保存できないこと' do  
        @item.price = 'ひらがな'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'priceがカタカナだと保存できないこと' do  
        @item.price = 'カタカナ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'priceが漢字だと保存できないこと' do  
        @item.price = '漢字'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid.")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end


    end
  end
end
