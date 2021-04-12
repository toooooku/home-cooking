require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context 'ユーザーが登録できる時' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end  
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end  
    context 'ユーザー登録できない時' do
      it 'nameが空では登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end  
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@がない場合登録できない' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end  
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end  
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end  
      it 'passwordが英語のみの場合登録できない' do
        @user.password = 'english'
        @user.password_confirmation = 'english'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合で入力してください")
      end
      it 'passwordが数字のみの場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合で入力してください")
      end
      it 'passwordが全角の場合登録できない' do
        @user.password = 'ゼンカク'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字混合で入力してください")
      end 
      it '重複したemailが存在する場合、登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end 
    end   
  end
end    
