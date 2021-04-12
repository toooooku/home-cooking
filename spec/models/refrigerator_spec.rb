require 'rails_helper'

RSpec.describe Refrigerator, type: :model do
  describe '#create' do
    before do
      @refrigerator = FactoryBot.build(:refrigerator)
    end

    context 'コメントが保存される時' do
      it 'foodstuffが存在すれば保存されること' do
        expect(@refrigerator).to be_valid      
      end
    end  
    context 'コメントが保存されない時' do
      it 'foodstuffが空だと保存されないこと' do
        @refrigerator.foodstuff = ''
        @refrigerator.valid?
        expect(@refrigerator.errors.full_messages).to include("食材を入力してください")
      end
      it 'userが紐づいていないと保存できないこと' do
        @refrigerator.user = nil
        @refrigerator.valid?
        expect(@refrigerator.errors.full_messages).to include("ユーザーを入力してください")
      end
    end  
  end
end
