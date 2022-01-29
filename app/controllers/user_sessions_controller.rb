class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_url, notice: 'ログインしました。'
    else
      redirect_to login_url, alert: 'ログインに失敗しました。'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  def guest_login
    random_value = SecureRandom.hex
    guest_user = User.create!(
      username: Gimei.last.kanji,
      email: "test_#{random_value}@example.com",
      password: 'password1234',
      password_confirmation: 'password1234'
    )
    20.times do
      Diary.create!(
        user_id: guest_user.id,
        title: Faker::Lorem.word,
        text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
        creativity: rand(10..100),
        emotion_point: rand(-1.0..1.0),
        word_count: rand(20..600),
        created_at: Faker::Date.backward(days: 7),
        sentiment_ids: rand(1..5)
      )
      DiarySentiment.create!(
        diary_id: rand(1..5),
        sentiment_id: rand(1..5)
      )
      Soliloquy.create!(
        user_id: guest_user.id,
        text: Faker::Lorem.sentence,
        created_at: Faker::Date.backward(days: 7)
      )
    end
    auto_login(guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end
end
