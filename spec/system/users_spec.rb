require 'rails_helper'

RSpec.describe 'ログイン・ログアウト', type: :system, js: true do
  let(:user) { create(:user) }

  describe 'サインアップ' do
    it 'ユーザーの新規作成後、ログインが成功する' do
      visit initial_path
      visit new_user_path
      fill_in 'user[username]', with: 'foo'
      fill_in 'user[email]', with: 'foo@example.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'アカウント作成'
      expect(page).to have_content 'ユーザー登録に成功しました。'
    end

    it 'サインアップが失敗してエラーメッセージが表示される' do
      visit initial_path
      visit new_user_path
      fill_in 'user[username]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      click_on 'アカウント作成'
      expect(user.errors).not_to be_added(:username, :blank)
      expect(user.errors).not_to be_added(:email, :blank)
      expect(user.errors).not_to be_added(:password, :blank)
      expect(user.errors).not_to be_added(:password_confirmation, :blank)
    end
  end

  describe 'ログイン' do
    context '成功' do
      before { create(:test_user) }

      it 'ログインに成功する' do
        visit initial_path
        visit login_path
        fill_in 'email', with: 'test@example.com'
        fill_in 'password', with: '123456'
        click_on 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end

    it 'ログインに失敗してエラーメッセージが表示される' do
      visit initial_path
      visit login_path
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      click_on 'ログイン'
      expect(user.errors).not_to be_added(:email, :blank)
      expect(user.errors).not_to be_added(:password, :blank)
    end
  end

  describe 'ログアウト' do
    it 'ログアウトに成功する' do
      login(@user)
      visit setting_path
      click_on 'ログアウト'
      expect(page).to have_content '初めてご利用される方'
      expect(page).to have_content 'ログインはこちら'
    end
  end
end
