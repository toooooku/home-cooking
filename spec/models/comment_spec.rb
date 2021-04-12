require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントが保存される時' do
      it 'textが存在すれば保存されること' do
        expect(@comment).to be_valid      
      end
    end  
    context 'コメントが保存されない時' do
      it 'textが空だと保存されないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
      it 'recipeが紐づいていないと保存できないこと' do
        @comment.recipe = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("レシピを入力してください")
      end
      
      it 'userが紐づいていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("ユーザーを入力してください")
      end
    end  
  end
end    
