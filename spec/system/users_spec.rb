require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'ログインに成功し、トップページに遷移する' do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    find('#login').click
    expect(current_path).to eq(root_path)
  end  
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)
    fill_in 'user_email', with: 'test'
    fill_in 'user_password', with: 'test'
    find('#login').click
    expect(current_path).to eq(new_user_session_path)
  end  
end   
