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
    @guest_user = User.create(
      username: 'ゲスト',
      email: "#{SecureRandom.alphanumeric(10)}@email.com",
      password: 'password',
      password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end
end
