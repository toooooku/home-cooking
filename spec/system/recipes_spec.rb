require 'rails_helper'

RSpec.describe "レシピ投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.build(:recipe)
  end
  context 'レシピ投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      sign_in(@user)
      expect(page).to have_content('レシピ投稿')
      visit new_recipe_path
      fill_in 'recipe_title', with: @recipe.title
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('recipe[image]', image_path, make_visible: true)
      expect{
        find('input[name="commit"]').click
      }.to change { Recipe.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_selector ('img')
    end
  end
  context 'レシピ投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe 'レシピ投稿編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recipe1 = FactoryBot.create(:recipe)
    @recipe2 = FactoryBot.create(:recipe)
  end
  context 'レシピ投稿編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したレシピの編集ができる' do
      sign_in(@recipe1.user)
      visit recipe_path(@recipe1)
      visit edit_recipe_path(@recipe1)
      expect(
        find('#recipe_title').value
      ).to eq(@recipe1.title)
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('recipe[image]', image_path, make_visible: true)
      fill_in 'recipe_title', with: "#{@recipe1.title}+編集したテキスト"
      image_path = Rails.root.join('public/images/test_image1.png')
      attach_file('recipe[image]', image_path, make_visible: true)
      expect{
        find('input[name="commit"]').click
      }.to change { Recipe.count }.by(0)
      expect(current_path).to eq(recipe_path(@recipe1))
      visit root_path
      expect(page).to have_content("#{@recipe1.title}+編集したテキスト")
      image_path = Rails.root.join('public/images/test_image1.png')
    end
  end
  context 'レシピ投稿の編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したレシピ投稿の編集画面には遷移できない' do
      sign_in(@recipe1.user)
      expect(page).to have_no_content('編集')
    end
    it 'ログインしていないユーザーはレシピ投稿の編集画面には遷移できない' do
      visit root_path
      expect(page).to have_no_content('編集')
    end
  end
end

RSpec.describe 'レシピ投稿削除', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recipe1 = FactoryBot.create(:recipe)
    @recipe2 = FactoryBot.create(:recipe)
  end
  context 'レシピ投稿削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したレシピを削除ができる' do
      sign_in(@recipe1.user)
      visit recipe_path(@recipe1)
      expect(page).to have_content('削除')
      find('input[name="commit"]').click
      expect(current_path).to eq(recipe_path(@recipe1))
      visit root_path
      image_path = Rails.root.join('public/images/test_image.png')
    end
  end  
  context 'レシピ投稿削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿しレシピの削除ができない' do
      sign_in(@recipe1.user)
      expect(page).to have_no_link '削除', href: recipe_path(@recipe2)
    end
    it 'ログインしていないとレシピ投稿の削除ボタンがない' do
      visit root_path
      expect(page).to have_no_content('削除')
    end
  end
end

RSpec.describe 'レシピ投稿詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.create(:recipe)
  end
  context 'レシピ投稿の詳細が確認できるとき' do
    it 'ログインしたユーザーはレシピ投稿の詳細が確認できる' do
      sign_in(@user)
      visit root_path
      image_path = Rails.root.join('public/images/test_image.png')
      expect{
        find('input[name="commit"]').click
      }.to change { Recipe.count }.by(0)
      visit recipe_path(@recipe)
    end
  end
  context 'レシピ投稿の詳細が確認できないとき' do
    it 'ログインしていないユーザーはレシピ投稿の詳細が確認できない' do
      visit root_path
      expect(page).to have_no_content('レシピ投稿')
    end
  end
end

RSpec.describe 'コメント詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recipe1 = FactoryBot.create(:recipe)
    @recipe2 = FactoryBot.create(:recipe)
  end
  context 'コメント投稿欄表示するとき' do
    it 'ログインしたユーザーはレシピ投稿詳細ページに遷移してコメント投稿欄が表示される' do
      sign_in(@recipe1.user)
      visit recipe_path(@recipe1)
      expect(page).to have_content ('コメント')
      expect(page).to have_content("#{@recipe_comment}")
      expect(page).to have_selector 'form'
    end
  end
  context 'コメント投稿欄表示しないとき' do
    it 'ログインしていないとレシピ投稿の削除ボタンがない' do
      visit root_path
      expect(page).to have_no_content('コメント')
    end
  end
end
