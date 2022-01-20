class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_url, notice: 'Login successful'
    else
      redirect_to login_url, alert: 'ログインに失敗しました'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  def guest_login
    random_value_user = SecureRandom.hex(5)
    random_value = SecureRandom.hex
    guest_user = User.create!(
      username: random_value_user,
      email: "test_#{random_value}@example.com",
      password: 'password1234',
      password_confirmation: 'password1234'
    )
    auto_login(guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end
end
