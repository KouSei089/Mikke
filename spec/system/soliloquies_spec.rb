require 'rails_helper'

RSpec.describe 'Soliloquy', type: :system do
  let(:user) { create(:user) }

  describe 'soliloquyの作成' do
    before { login(@user) }

    it 'soliloquyが正しく作成できる' do
      visit new_soliloquy_path
      fill_in 'soliloquy[text]', with: '今日も書くよ。'
      click_on 'button'
      expect(page).to have_content 'ひとりごとをつぶやきました。'
    end

    it 'soliloquyの投稿が失敗する' do
      visit new_soliloquy_path
      fill_in 'soliloquy[text]', with: ''
      click_on 'button'
      expect(page).to have_content 'テキストを入力してください'
    end
  end

  describe 'soliloquyの編集' do
    before do
      @soliloquy = create(:soliloquy)
    end

    it 'soliloquyが正しく編集できる' do
      visit login_path
      fill_in 'email', with: 'foo@example.com'
      fill_in 'password', with: '123456'
      click_on 'ログイン'
      visit edit_soliloquy_path(@soliloquy)
      fill_in 'soliloquy[text]', with: '内容の変更', fill_options: { clear: :backspace }
      click_on 'button'
      expect(page).to have_content 'ひとりごとをつぶやきました。'
    end
  end
  # showページ作成後再度修正する
  # describe 'soliloquyの削除' do
  #   before do
  #     @soliloquy = create(:soliloquy)
  #   end
  #   it 'soliloquyが正しく削除できる' do
  #     visit login_path
  #     fill_in 'email', with: 'foo@example.com'
  #     fill_in 'password', with: '123456'
  #     click_on 'ログイン'
  #     click_on '削除'
  #   end
  # end
end
