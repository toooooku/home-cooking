require 'rails_helper'

RSpec.describe "リクエスト料理投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @blog = FactoryBot.create(:blog)
  end
  context 'リクエスト料理投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      sign_in(@user)
      visit new_blog_path
      expect(page).to have_content('リクエスト料理')
      fill_in 'blog_title', with: @blog.title
      expect{
        find('input[name="commit"]').click
      }.to change { Blog.count }.by(1)
      expect(current_path).to eq(blogs_path)
    end
  end
  context 'リクエスト料理投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_content('リクエスト料理')
    end
  end
end

RSpec.describe 'リクエスト料理削除', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @blog = FactoryBot.create(:blog)
  end
  context 'リクエスト料理が削除できるとき' do
    it 'ログインしたユーザーはリクエスト料理投稿を削除ができる' do
      sign_in(@user)
      visit new_blog_path
      expect(page).to have_content('リクエスト料理')
      fill_in 'blog_title', with: @blog.title
      expect{
      find('input[name="commit"]').click
      }.to change { Blog.count }.by(1)
      expect(current_path).to eq(blogs_path)
      visit blogs_path(@recipe)
      expect(page).to have_content('[x]')
      find_link('[x]').click
      expect(current_path).to eq(blogs_path)
      visit blogs_path
    end
  end  
  context 'リクエスト料理投稿削除ができないとき' do
    it 'ログインしていないとレシピ投稿の削除ボタンがない' do
      visit root_path
      expect(page).to have_no_content('リクエスト料理')
    end
  end
end

RSpec.describe 'リクエスト料理投稿詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @blog = FactoryBot.create(:blog)
  end
  context 'リクエスト料理の詳細が確認できるとき' do
    it 'ログインしたユーザーはリクエスト料理の詳細が確認できる' do
      sign_in(@user)
      visit new_blog_path
      expect(page).to have_content('リクエスト料理')
      fill_in 'blog_title', with: @blog.title
      expect{
      find('input[name="commit"]').click
      }.to change { Blog.count }.by(1)
      visit blogs_path(@blog)
      expect(page).to have_content('リクエスト料理')
      find_link('リクエスト料理').click
      visit blog_path(@blog)
      fill_in 'blog_title', with: @blog.title
      expect(current_path).to eq(blog_path(@blog))
      visit root_path      
    end
  end
  context 'リクエスト料理の詳細が確認できないとき' do
    it 'ログインしていないユーザーはリクエスト料理の詳細が確認できない' do
      visit root_path
      expect(page).to have_no_content('リクエスト料理')
    end
  end
end
