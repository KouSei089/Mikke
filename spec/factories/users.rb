FactoryBot.define do
  factory :user do
    username { 'テストユーザー' }
    email { 'foo@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
  factory :test_user, class: 'User' do
    username { 'テストユーザー2' }
    email { 'test@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
