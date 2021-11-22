class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

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
end
