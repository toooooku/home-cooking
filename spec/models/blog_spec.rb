require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe '#create' do
    before do
      @blog = FactoryBot.build(:blog)
    end

    context 'リクエストできる時' do
      it 'titleとstart_timeが存在すれば保存できること' do
        expect(@blog).to be_valid
      end  
      it 'contentが空でも保存できること'do
        @blog.content = ''
        expect(@blog).to be_valid
      end 
    end    
    context 'リクエストできない時' do
      it 'titleが空では保存できないこと' do
        @blog.title = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("メニュー名を入力してください")
      end
      it 'start_timeが空では保存できないこと' do
        @blog.start_time = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Start timeを入力してください")
      end
      it 'titleとstart_timeが空だと保存できないこと'do
        @blog.title = ''
        @blog.start_time = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("メニュー名を入力してください", "Start timeを入力してください")
      end
    end  
  end
end  