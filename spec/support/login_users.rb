module LoginUsers
  def login(_user)
    visit new_initial_path
    visit new_user_path
    fill_in 'user[username]', with: 'foo'
    fill_in 'user[email]', with: 'foo@example.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'アカウント作成'
  end
end
