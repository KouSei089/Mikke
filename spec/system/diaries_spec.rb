require 'rails_helper'

RSpec.describe 'Diary', type: :system do
  let(:user) { create(:user) }

  describe 'diaryの作成' do
    before { login(@user) }

    it 'diaryが正しく作成できる' do
      visit new_diary_path
      fill_in 'diary[title]', with: '今日も書く'
      fill_in 'diary[text]', with: '書く内容'
      find('button.offset-1').click
      expect(page).to have_content '今の感情を選んでみましょう。'
      check '怒り'
      find('button.offset-2').click
      expect(page).to have_content 'Trivia'
      find('button.offset-3').click
      expect(page).to have_content '筆記開示を登録しました。'
    end

    it 'diaryの投稿が失敗する' do
      visit new_diary_path
      fill_in 'diary[title]', with: ''
      fill_in 'diary[text]', with: ''
      find('button.offset-1').click
      find('button.offset-2').click
      expect(page).to have_content 'テキストを入力してください'
    end
  end

  describe 'diaryの編集' do
    before do
      @diary = create(:diary)
    end

    it 'diaryのタイトルとテキストを正しく編集できる' do
      visit login_path
      fill_in 'email', with: 'foo@example.com'
      fill_in 'password', with: '123456'
      click_on 'ログイン'
      visit edit_diary_path(@diary)
      fill_in 'diary[title]', with: '追加', fill_options: { clear: :backspace }
      fill_in 'diary[text]', with: '追加', fill_options: { clear: :backspace }
      find('button.offset-1').click
      find('button.offset-2').click
      expect(page).to have_content 'Trivia'
      find('button.offset-3').click
      expect(page).to have_content '筆記開示を編集しました。'
    end

    it 'diaryの感情選択を変更できる' do
      visit login_path
      fill_in 'email', with: 'foo@example.com'
      fill_in 'password', with: '123456'
      click_on 'ログイン'
      visit edit_diary_path(@diary)
      fill_in 'diary[title]', with: '追加', fill_options: { clear: :backspace }
      fill_in 'diary[text]', with: '追加', fill_options: { clear: :backspace }
      find('button.offset-1').click
      uncheck '激怒'
      check '関心'
      find('button.offset-2').click
      expect(page).to have_content 'Trivia'
      find('button.offset-3').click
      expect(page).to have_content '筆記開示を編集しました。'
    end
  end
  # showページ作成後再度修正する
  # describe 'diaryの削除' do
  #   before do
  #     @diary = create(:diary)
  #   end
  #   it 'diaryが正しく削除できる' do
  #     visit login_path
  #     fill_in 'email', with: 'foo@example.com'
  #     fill_in 'password', with: '123456'
  #     click_on 'ログイン'
  #   end
  # end
end
