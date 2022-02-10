require 'rails_helper'

RSpec.describe 'ログイン・ログアウト', type: :system do
  before do
    @user = User.create(username: '泉', email: 'test@example.com', password: '1234', password_confirmation: '1234')
  end

  it 'ユーザーの新規作成後、ログインが成功する。' do
    visit new_initial_path
    visit new_user_path
    fill_in 'user[username]', with: 'foo'
    fill_in 'user[email]', with: 'foo@example.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'アカウント作成'
    expect(page).to have_content 'ユーザー登録に成功しました。'
  end

  it 'ログアウト' do
    login(@user)
  end
end
