class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :demo_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_url, notice: t('user_sessions.flash.notice')
    else
      redirect_to login_url, alert: t('user_sessions.flash.alert')
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  def demo_login
    @demo_user = User.demo_user
    create_contents
    auto_login(@demo_user)
    redirect_to root_path, notice: t('user_sessions.flash.demo')
  end

  private

    def create_contents
      5.times do
        Diary.create!(
          user_id: @demo_user.id,
          title: Faker::Book.title,
          text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
          creativity: rand(10..100),
          emotion_point: rand(-1.0..1.0),
          word_count: rand(20..600),
          created_at: Faker::Date.backward(days: 7),
          sentiment_ids: [rand(1..8), rand(9..16), rand(7..24)]
        )
        Soliloquy.create!(
          user_id: @demo_user.id,
          text: Faker::Lorem.sentence,
          created_at: Faker::Date.backward(days: 7)
        )
      end
    end
end
