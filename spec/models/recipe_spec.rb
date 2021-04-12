require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#create' do
    before do
      @recipe = FactoryBot.build(:recipe)
    end
  
    context 'レシピ投稿できる時' do
      it 'titleとimageが存在すれば保存できること'do
        expect(@recipe).to be_valid
      end
      it 'cooking_recipeが空でも保存できること'do
        @recipe.cooking_recipe = ''
        expect(@recipe).to be_valid
      end
    end
    context 'レシピ投稿ができない時' do  
      it 'titleが空だと保存できないこと'do
        @recipe.title = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("料理名を入力してください")
      end
      it 'imageが空だと保存できないこと'do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("料理の写真を入力してください")
      end
      it 'titleとimageが空だと保存できないこと'do
        @recipe.title = ''
        @recipe.image = nil
        @recipe.valid?
      expect(@recipe.errors.full_messages).to include("料理名を入力してください", "料理の写真を入力してください")
      end
    end
  end
end    
